# Maintainer: orhun <github.com/orhun>
pkgname=zps-git
pkgdesc="A small utility for listing and reaping zombie processes."
pkgver=1.1.0.r0.g0d8dbbf
pkgrel=1
arch=('any')
url="https://github.com/orhun/zps"
license=('GPL3')
makedepends=('cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git://github.com/orhun/zps.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "${pkgname%-git}/build"
  cd "${pkgname%-git}/build"
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname%-git}/build"
  make DESTDIR="$pkgdir" install
}
