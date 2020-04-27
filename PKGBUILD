pkgname=epson-inkjet-printer-escpr2
pkgver=1.1.11
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('GPL2')
depends=('cups' 'ghostscript')
makedepends=('automake')
optdepends=('imagescan: scanner support')
options=('!libtool')
source=('https://download3.ebz.epson.net/dsc/f/03/00/11/01/98/8ff121831d0a6be76e86b87c78178f3c93df6d0f/epson-inkjet-printer-escpr2-1.1.11-1lsb3.2.src.rpm'
        'bug_x86_64.patch')
sha256sums=('d5c6b99e90f0584f0705ef1b188710938eb5a3d6ad1a5325655e9e4871fd8dbd'
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
