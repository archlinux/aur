# Maintainer: Simon Repp <simon@fdpl.io>

arch=('i686' 'x86_64')
depends=('gpgme' 'icu' 'libeno' 'ncurses')
license=('GPL3')
makedepends=('meson')
md5sums=('fbf4de6725a18b85beecfbe504fb8db6')
pkgdesc="Minimal plaintext password store"
pkgname=sicuit
pkgrel=1
pkgver=8.0
url="https://fdpl.io/sicuit/"

source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/simonrepp/sicuit/archive/${pkgver}.tar.gz")

build() {
  cd "${srcdir}"/sicuit
  rm -rf build
  meson --buildtype release --prefix /usr build
  cd build
  meson compile
}

package() {
  cd "${srcdir}"/sicuit/build
  DESTDIR="${pkgdir}" meson install
}
