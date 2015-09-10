# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: James An <james@jamesan.ca>
# Contributor: Stefano Bergamini <bergs at live dot it>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: Quentin Foussette <quentinf7@gmail.com>

pkgname=epson-inkjet-printer-escpr
pkgver=1.5.2
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver (ESC/P-R) for Linux"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('GPL2')
depends=('cups' 'ghostscript')
options=('!libtool')
source=("https://download3.ebz.epson.net/dsc/f/03/00/04/11/66/a0e858032ab0fd6a32c7fb3b7e447a0229e79141/$pkgname-$pkgver-1lsb3.2.tar.gz")
sha256sums=('9229aa8a033e97e29b0671082d08e1c56ebbee4e5adb2f350f81181835f06be8')

prepare() {
  tar zxf "$pkgname-$pkgver-1lsb3.2.tar.gz"
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --with-cupsfilterdir=/usr/lib/cups/filter \
              --with-cupsppddir=/usr/share/ppd
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

