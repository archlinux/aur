# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgdesc='Alternative terminfo files for the foot terminal emulator, with additional non-standard capabilities'
pkgname=foot-terminfo-git
pkgver=1.25.0
pkgrel=1
conflicts=('foot-terminfo')
provides=('foot-terminfo')
arch=('any')
url=https://codeberg.org/dnkl/foot
license=(mit)
makedepends=('git' 'ncurses')
source=(git+https://codeberg.org/dnkl/foot.git)
sha256sums=('SKIP')
install=foot-terminfo-git.install

pkgver() {
  cd foot
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
