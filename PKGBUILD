# Maintainer: Kiril Zyapkov <kiril.zyapkov at gmail>
pkgname=libarea-git
pkgver=120.f1986ac
pkgrel=2
pkgdesc="Library and python module for pocketing and profiling operations"
arch=('x86_64')
url="https://github.com/Heeks/libarea"
license=('custom:BSD3')
depends=('python' 'opencascade' 'boost')
makedepends=('git' 'cmake')
provides=('libarea')
source=('libarea-git::git://github.com/Heeks/libarea.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  #echo $(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  msg "Starting build..."
  export CASROOT=/opt/opencascade
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
}

package() {
  cd "$srcdir/${pkgname}/build"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/licenses/libarea-git"
  install -m644 "$srcdir/${pkgname}/debian/copyright" "$pkgdir/usr/share/licenses/libarea-git/copyright"
}
