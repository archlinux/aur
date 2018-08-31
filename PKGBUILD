pkgname=epson-inkjet-printer-escpr2
pkgver=1.0.19
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('GPL2')
depends=('cups' 'ghostscript')
optdepends=('imagescan: scanner support')
options=('!libtool')
source=('https://download3.ebz.epson.net/dsc/f/03/00/07/79/25/7489fcaccf48edcf3dea1264fedda30202758a69/epson-inkjet-printer-escpr2-1.0.19-1lsb3.2.src.rpm'
        'bug_x86_64.patch')
sha256sums=('0a1eb608c05ed29b96961213113556d8fc6ff28e89a3785e03b1a1efcf0b9c51'
            '44160b2ef140e97137d65c4db7a50cfe40399ab8691caaeaf43c08f758b8c545')

prepare() {
  tar xvf "$pkgname-$pkgver-$pkgrel"lsb3.2.tar.gz
  
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
