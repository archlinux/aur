# Maintainer : Breizh <breizh.craft.98@openmailbox.org>
pkgname=libp7
pkgver=2.0
pkgrel=2
pkgdesc="Casio Communication Protocol 7.00 implementation"
arch=('i686' 'x86_64')
url="https://p7.touhey.fr/"
license=('GPL2')
groups=()
depends=('libusb>=1.0')
makedepends=('make>=4.0' 'gcc>=4.9' 'asciidoc>=8.6.9' 'gzip>=1.6' 'binutils>=2.25')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://p7.touhey.fr/pub/${pkgname}-${pkgver}.tar.gz)
noextract=()
md5sums=('e17e017f4728ec09efce0f67d08537c4')

build() {
  cd "$pkgname-$pkgver"
  ./configure && make
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
  mkdir -p $pkgdir/etc/rules.d/
  echo 'ACTION=="add", ATTR{idVendor}=="07cf", ATTR{idProduct}=="6101", MODE="0666"' > $pkgdir/etc/rules.d/60-casio-calculators-usb.rules
}
