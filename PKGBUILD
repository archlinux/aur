# Maintainer: Nícolas Bordignon dos Santos <nicolas.bordignon16@gmail.com>
# Co-Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: James An <james@jamesan.ca>
# Contributor: Stefano Bergamini <bergs at live dot it>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: Quentin Foussette <quentinf7@gmail.com>
# Contributor: MetaNova

pkgname=epson-inkjet-printer-escpr
pkgver=1.7.5
pkgrel=1
pkgdesc='Epson Inkjet Printer Driver (ESC/P-R) for Linux'
arch=('x86_64')
url='http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX'
license=('GPL2')
depends=('cups' 'ghostscript')
source=('https://download3.ebz.epson.net/dsc/f/03/00/10/29/40/898523640509d296a9988eee753a7299f518ceb0/epson-inkjet-printer-escpr-1.7.5-1lsb3.2.tar.gz'
        'bug_x86_64.patch')
sha512sums=('bebf68bd14f16c4321bee73a16f7ea6ec68c843630e81522c627324aaa765a3a5f4997f84e40ed0da2abe374d0405f5934d85eaf1c9921d6605b5b1b399fa2e1'
            'ff4f736ec884c4d2354a83c89ee535732cb414ef0c6443bdc8ec869f889f486b242d76e143ad59d61b182231697dfe3bdf68122cb8aae873a9776ce109a07dab')


prepare() {
  cd $pkgname-$pkgver

  patch -p1 < ../bug_x86_64.patch

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
