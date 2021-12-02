# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgdesc='Alternative terminfo files for the foot terminal emulator, with additional non-standard capabilities'
pkgname=foot-terminfo
pkgver=1.10.2
pkgrel=1
arch=('any')
url=https://codeberg.org/dnkl/foot
license=(mit)
makedepends=('ncurses')
source=(foot-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('49ad179d5815bf76f8ccdd869b28ce56e3cb5aab8e73e45b09c7510d4a5086d7')
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
