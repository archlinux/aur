pkgname=epson-inkjet-printer-escpr2
pkgver=1.1.47
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('GPL2')
depends=('cups' 'ghostscript')
optdepends=('imagescan: scanner support')
options=('!libtool')
source=('https://download3.ebz.epson.net/dsc/f/03/00/13/47/59/ed3005ef39641b1a82a8701a36a04677459e1c7e/epson-inkjet-printer-escpr2-1.1.47-1lsb3.2.src.rpm'
        'bug_x86_64.patch')
sha256sums=('53c0256cc4b7a9fa32acd59e436f95659eadbc39078404bcffe5545fb10dfd83'
            'ae480931863a195fb924fc5e5ea00478b3faa6cfb1507919d462f122be7d7084')

prepare() {
  tar xvf "$pkgname-$pkgver"-1lsb3.2.tar.gz
  
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
