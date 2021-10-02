# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgdesc='Terminfo files for the foot terminal emulator'
pkgname=foot-terminfo-git
pkgver=1.9.2
pkgrel=1
conflicts=('foot-terminfo')
provides=('foot-terminfo')
arch=('any')
url=https://codeberg.org/dnkl/foot
license=(mit)
makedepends=('ncurses')
source=(git+https://codeberg.org/dnkl/foot.git)
sha256sums=('SKIP')

pkgver() {
  cd foot
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
