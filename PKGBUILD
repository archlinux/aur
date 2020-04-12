# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=madrigal-git
pkgver=r192.8395a23
pkgrel=3
pkgdesc="Qt5 OpenHome control point, still in development"
arch=(i686 x86_64)
url="https://github.com/CDrummond/madrigal"
license=(GPL3)
depends=(qt5-svg hicolor-icon-theme)
makedepends=(git cmake)
provides=(madrigal)
source=("${pkgname}::git+https://github.com/CDrummond/madrigal.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd "$srcdir/$pkgname"
  mkdir -p build
}
build() {
  cd "$srcdir/$pkgname/build"
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}
package() {
  cd ${srcdir}/${pkgname}/build
  make DESTDIR=$pkgdir install
}
