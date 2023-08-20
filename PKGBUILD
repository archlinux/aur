pkgname=epson-inkjet-printer-escpr2
pkgver=1.2.3
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('GPL2')
depends=('cups' 'ghostscript')
optdepends=('imagescan: scanner support')
options=('!libtool')
source=('https://download3.ebz.epson.net/dsc/f/03/00/14/75/78/aeb37e000452a166daca5daad8ac74cd25b80be6/epson-inkjet-printer-escpr2-1.2.3-1.tar.gz'
        'bug_x86_64.patch')
sha256sums=('bbed26ca1f3762138a6bcc08b8f5673bb90ab6c06418661adb84f652b08b7ff3'
            'ae480931863a195fb924fc5e5ea00478b3faa6cfb1507919d462f122be7d7084')

prepare() {
  tar xvf "$pkgname-$pkgver"-1.tar.gz
  
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
