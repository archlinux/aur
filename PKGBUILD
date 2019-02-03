pkgname=epson-inkjet-printer-escpr2
pkgver=1.0.30
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('GPL2')
depends=('cups' 'ghostscript')
makedepends=('automake')
optdepends=('imagescan: scanner support')
options=('!libtool')
source=('https://download3.ebz.epson.net/dsc/f/03/00/09/05/60/5d9541e9829aa99bc591d5d6f01e4248b7ae1661/epson-inkjet-printer-escpr2-1.0.30-1lsb3.2.src.rpm'
        'bug_x86_64.patch')
sha256sums=('7fa9f07b7deca3db8b798bb90d7cccdd229e5df800e3f2d1c1a98f8c11dd0966'
            '44160b2ef140e97137d65c4db7a50cfe40399ab8691caaeaf43c08f758b8c545')

prepare() {
  tar xvf "$pkgname-$pkgver-$pkgrel"lsb3.2.tar.gz
  
  cd "$pkgname-$pkgver"

  patch -p1 -i "${srcdir}/bug_x86_64.patch"
}

build() {
  cd "$pkgname-$pkgver"
  
  autoreconf -f -i

  ./configure --prefix=/usr \
              --with-cupsfilterdir=/usr/lib/cups/filter \
              --with-cupsppddir=/usr/share/ppd
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
