# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgdesc='Alternative terminfo files for the foot terminal emulator, with additional non-standard capabilities'
pkgname=foot-terminfo
pkgver=1.9.2
pkgrel=2
arch=('any')
url=https://codeberg.org/dnkl/foot
license=(mit)
makedepends=('ncurses')
source=(foot-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('5859d8d7293da4c7c52f45a9756fc7989edc364057e8b86b4e1fbea7bc2b4009')
install=foot-terminfo-git.install

build() {
  cd foot
  mkdir -p build
  sed 's/@default_terminfo@/foot-extra/g' foot.info | tic -x -o build -e foot-extra,foot-extra-direct -
}

package() {
  cd foot
  install -dm 755 "${pkgdir}/usr/share/terminfo/f"
  cp build/f/foot-extra{,-direct} "${pkgdir}/usr/share/terminfo/f/"
}
