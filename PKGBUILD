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
pkgver=1.8.0
pkgrel=3
pkgdesc='Epson Inkjet Printer Driver (ESC/P-R) for Linux'
arch=('x86_64' 'aarch64')
url='http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX'
license=('GPL2')
depends=('cups' 'ghostscript')
#source=('https://download3.ebz.epson.net/dsc/f/03/00/14/61/10/3e39b2cbc42fdca860905d55f710e16f6308fd26/epson-inkjet-printer-escpr_1.8.0-1_amd64.deb'
source=('https://download3.ebz.epson.net/dsc/f/03/00/14/61/06/ad3f08f88782de47a1aec9acda205e354309636e/epson-inkjet-printer-escpr-1.8.0-1.src.rpm')
sha512sums=('20d99a6bde042cd964313941b4d74f380675f160de60cff7db8190bb970d47eb89f05c7efd9e273156f2868c5df9ec178aa1116be60879b2415a73f135229c0b')


prepare() {
  cd $srcdir

#  patch -p1 < ../bug_x86_64.patch
  tar xzf $pkgname-$pkgver-1.tar.gz
  cd $pkgname-$pkgver
  autoreconf -vif
}

build() {
  cd $pkgname-$pkgver

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
