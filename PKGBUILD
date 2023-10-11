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
pkgver=1.8.1
pkgrel=1
pkgdesc='Epson Inkjet Printer Driver (ESC/P-R) for Linux'
arch=('x86_64' 'aarch64')
url='http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX'
license=('GPL2')
depends=('cups' 'ghostscript')
#source=('https://download3.ebz.epson.net/dsc/f/03/00/14/61/10/3e39b2cbc42fdca860905d55f710e16f6308fd26/epson-inkjet-printer-escpr_1.8.0-1_amd64.deb'
source=("epson-inkjet-printer-escpr-$pkgver-1.src.rpm::https://download.ebz.epson.net/dsc/du/02/DriverDownloadInfo.do?LG2=JA&CN2=US&CTI=176&PRN=Linux%20src.rpm%20package&OSC=LX&DL")
sha512sums=('31b2b5629b168d90353e9230e2973f6ee8ce0643b960c35e95d29a8900d603acfff0b40afeb282897e8e5ae47b6362086515cdb65a264d0aa3deea2f8a304544')


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
