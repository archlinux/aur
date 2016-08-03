# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=opencamlib-git
pkgver=11.10.64.g89c21a2
pkgrel=1
pkgdesc="Multi-Purpose CNC Toolpath Library"
arch=('i686' 'x86_64')
url="https://github.com/aewallin/opencamlib"
license=('GPL3')
makedepends=('boost' 'cmake' 'doxygen')
depends=('python2' 'boost')
provides=('opencamlib')
conflicts=('opencamlib')
source=("git+https://github.com/aewallin/opencamlib.git" 'CMakeLists.txt.patch')
md5sums=('SKIP' 'c76fcdacce09047308509caf50a8cd5a')

pkgver() {
  cd opencamlib
  git describe --tags | sed 's/-/./g'
}

prepare() {
  cd "$srcdir/opencamlib/src"
  patch < $srcdir/CMakeLists.txt.patch
}

build() {
  mkdir "$srcdir/opencamlib/build"
  cd "$srcdir/opencamlib/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/opencamlib/build"
  make install DESTDIR=$pkgdir
}
