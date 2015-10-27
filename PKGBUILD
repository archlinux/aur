# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: James An <james@jamesan.ca>
# Contributor: Stefano Bergamini <bergs at live dot it>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: Quentin Foussette <quentinf7@gmail.com>

pkgname=epson-inkjet-printer-escpr
pkgver=1.6.1
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver (ESC/P-R) for Linux"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('GPL2')
depends=('cups' 'ghostscript')
options=('!libtool')
source=("https://download3.ebz.epson.net/dsc/f/03/00/04/23/02/a5ee7e1622b0ba692bea6763d6d7f4810a8d0808/$pkgname-$pkgver-1lsb3.2.tar.gz")
sha256sums=('bb7dea7439c571662db9cf7a8834cb87ed69fa249a7945218403187c6097c76f')

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

