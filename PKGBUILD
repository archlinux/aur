# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=meteor-demod-git
pkgver=r75.bf8f6eb
pkgrel=1
pkgdesc="Meteor-M2 LRPT demodulator"
arch=(any)
license=('GPL')
url="https://github.com/dbdexter-dev/meteor_demod"
depends=(ncurses)
makedepends=(git cmake)
provides=(meteor-demod)
conflicts=(meteor-demod)
source=("${pkgname}::git+https://github.com/dbdexter-dev/meteor_demod.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"

  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${pkgname}/build"

  make DESTDIR="${pkgdir}" install
}
