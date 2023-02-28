# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=opencamlib-git
pkgver=2023.01.11.4.ge4a5a7d
pkgrel=1
pkgdesc="Multi-Purpose CNC Toolpath Library"
arch=('i686' 'x86_64')
url="https://github.com/aewallin/opencamlib"
license=('LGPL')
makedepends=('boost' 'cmake' 'doxygen' 'git')
depends=('python' 'boost')
provides=('opencamlib')
conflicts=('opencamlib')
source=("git+https://github.com/aewallin/opencamlib.git"
        "opencamlib.conf")
md5sums=('SKIP'
         'a47c8358b60c11c4d620e6a0c24c0b50')

pkgver() {
  cd opencamlib
  git describe --tags | sed 's/-/./g'
}

build() {
  mkdir -p "$srcdir/opencamlib/build"
  cd "$srcdir/opencamlib/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_PY_3="ON" -DBUILD_PY_LIB="ON" ../
  make
}

package() {
  cd "$srcdir/opencamlib/build"
  make install DESTDIR=$pkgdir
  install -Dm644 "$srcdir/opencamlib.conf" "${pkgdir}/etc/ld.so.conf.d/opencamlib.conf"
}
