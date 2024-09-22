# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Nícolas Bordignon dos Santos <nicolas.bordignon16@gmail.com>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: James An <james@jamesan.ca>
# Contributor: Stefano Bergamini <bergs at live dot it>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: Quentin Foussette <quentinf7@gmail.com>
# Contributor: MetaNova

pkgname=epson-inkjet-printer-escpr
pkgver=1.8.5
pkgrel=2
pkgdesc='Epson Inkjet Printer Driver (ESC/P-R) for Linux'
arch=('x86_64' 'aarch64')
url='http://support.epson.net/linux/Printer/LSB_distribution_pages/en/escpr.php'
license=('GPL2')
depends=('cups' 'ghostscript')
source=('https://download3.ebz.epson.net/dsc/f/03/00/15/68/85/403b320df777490a52c42030397edd10363b2c56/epson-inkjet-printer-escpr-1.8.5-1.src.rpm')
sha512sums=('acbe3318ec230e23abc0f20e30c6250f2381bd0824ca3451d0a01b482b0e55a05c1f307d37b83190785b7ee94f82c1651e2b5b1852724dbdcd358402c5939531')


prepare() {
  cd $srcdir

  tar xzf $pkgname-$pkgver-1.tar.gz
  cd $pkgname-$pkgver
  autoreconf -vif
}

build() {
  cd $pkgname-$pkgver

  CFLAGS="${CFLAGS} -Wno-implicit-function-declaration"

  ./configure \
  	--prefix=/usr \
  	--with-cupsfilterdir=/usr/lib/cups/filter \
  	--with-cupsppddir=/usr/share/ppd

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
