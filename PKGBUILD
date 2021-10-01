# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgdesc="Terminfo files for the foot terminal emulator"
pkgname=foot-terminfo
pkgver=1.9.1
pkgrel=1
arch=('any')
url=https://codeberg.org/dnkl/foot
license=(mit)
makedepends=('ncurses')
source=(foot-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('1277cfb6c88fbf299d115446cfa2a33cd6ddf88225989c84e6579024675edb97')

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
