# Maintainer: David Runge <dave@sleepmap.de>
pkgname=qxgedit
pkgver=0.5.1
pkgrel=1
pkgdesc="GUI for editing MIDI System Exclusive files for XG devices (eg. Yamaha DB50XG)"
arch=('x86_64')
url="https://qxgedit.sourceforge.io/"
license=('GPL2')
groups=('pro-audio')
depends=('alsa-lib' 'hicolor-icon-theme' 'qt5-base')
makedepends=('qt5-tools')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('4004536705454dbca04dff6b0d88f411f22503637ed15823d960d25d2f4beda88c40b310311a0856b57bdd32b922b89f6dd2756eda0b938f35d271e9b48292d8')

prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -vfi
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -vDm 644 {AUTHORS,ChangeLog,README,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
