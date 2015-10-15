# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: James An <james@jamesan.ca>
# Contributor: Stefano Bergamini <bergs at live dot it>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: Quentin Foussette <quentinf7@gmail.com>

pkgname=epson-inkjet-printer-escpr
pkgver=1.6.0
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver (ESC/P-R) for Linux"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('GPL2')
depends=('cups' 'ghostscript')
options=('!libtool')
source=("https://download3.ebz.epson.net/dsc/f/03/00/04/17/54/b44d3f2dc28e05cc151233ea330f35e2a8657908/$pkgname-$pkgver-1lsb3.2.tar.gz")
sha256sums=('745aa837edfca269800d3c5fd2b81b40f4e3e9a316bc0c1a3e265260e3184f95')

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

