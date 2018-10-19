# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: James An <james@jamesan.ca>
# Contributor: Stefano Bergamini <bergs at live dot it>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: Quentin Foussette <quentinf7@gmail.com>
# Contributor: MetaNova

pkgname=epson-inkjet-printer-escpr
pkgver=1.6.30
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver (ESC/P-R) for Linux"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('GPL2')
depends=('cups' 'ghostscript')
options=('!libtool')
source=('https://download3.ebz.epson.net/dsc/f/03/00/08/37/47/d522643d893358c730210b29712d67560555181a/epson-inkjet-printer-escpr-1.6.31-1lsb3.2.tar.gz'
        'bug_x86_64.patch')
sha256sums=('aa2fc6c3e7c8eb42ead42963691e7ba4bd12d8043c89912d1e962bac1605d9aa'
            '277bc9afe581d2c434217db646e20ecfd1b6045bdcce861f2f08992ccf854084')

prepare() {
  cd "$pkgname-$pkgver"

  patch -p1 -i "${srcdir}/bug_x86_64.patch"

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

