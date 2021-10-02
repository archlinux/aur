# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgdesc="Terminfo files for the foot terminal emulator"
pkgname=foot-terminfo
pkgver=1.9.2
pkgrel=1
arch=('any')
url=https://codeberg.org/dnkl/foot
license=(mit)
makedepends=('ncurses')
source=(foot-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('5859d8d7293da4c7c52f45a9756fc7989edc364057e8b86b4e1fbea7bc2b4009')

build() {
  cd foot
  mkdir -p build
  sed 's/@default_terminfo@/foot/g' foot.info | tic -x -o build -e foot,foot-direct -
}

package() {
  cd foot
  install -dm 755 "${pkgdir}/usr/share/terminfo/f/"
  cp build/f/* "${pkgdir}/usr/share/terminfo/f/"
}
