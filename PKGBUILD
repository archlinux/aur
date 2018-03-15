# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: James An <james@jamesan.ca>
# Contributor: Stefano Bergamini <bergs at live dot it>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: Quentin Foussette <quentinf7@gmail.com>
# Contributor: MetaNova

pkgname=epson-inkjet-printer-escpr
pkgver=1.6.19
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver (ESC/P-R) for Linux"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('GPL2')
depends=('cups' 'ghostscript')
options=('!libtool')
source=('https://download3.ebz.epson.net/dsc/f/03/00/07/07/57/91f8069e80d17a5dade2f18eda1ade2d49297840/epson-inkjet-printer-escpr-1.6.19-1lsb3.2.tar.gz'
        'bug_x86_64.patch')
sha256sums=('ed99a18cbc5d0c8549996efbfee21db00cc95c1136237e626d2a2ef2144d34b7'
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

