# Contributor: Anatol Pomozov
# Contributor: Benjamin Chrétien <chretien + aur [at] lirmm [dot] fr>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rasi <rasi@xssn.at>
# Contributor: Sean Pringle <sean.pringle@gmail.com>
# Contributor: SanskritFritz (gmail)
# Maintainer: N. I.
pkgname=rofi-0.15.12
pkgver=0.15.12
pkgrel=1
pkgdesc='Popup window switcher roughly based on superswitcher, requiring only xlib and xft (0.15.12 is the last release with daemon-mode feature)'
arch=(i686 x86_64)
url='https://davedavenport.github.io/rofi/'
license=(MIT)
depends=(libx11 libxft freetype2 libxdg-basedir libxinerama pango startup-notification)
makedepends=(i3-wm)
conflicts=(rofi)
optdepends=('i3-wm: use as a window switcher')
source=(rofi-$pkgver.zip::https://github.com/DaveDavenport/rofi/archive/$pkgver.zip)
sha256sums=('e52a2ded1cf2e9681ed5946aba22c8d2810ef9987f7cf7dbc81d18e401d96c6e')

build() {
  cd rofi-$pkgver
  autoreconf -i
  ./configure --prefix=/usr
  make
}

check() {
  cd rofi-$pkgver
  make test
}

package() {
  cd rofi-$pkgver
  make install install-man DESTDIR="$pkgdir"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/rofi/COPYING"
  install -dm755 "$pkgdir/usr/share/doc/rofi/examples"
  install -Dm755 Examples/*.sh "$pkgdir/usr/share/doc/rofi/examples"
}
