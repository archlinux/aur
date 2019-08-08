# Mainteiner: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Nícolas Bordignon dos Santos <nicolas.bordignon16@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor:  Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: James An <james@jamesan.ca>
# Contributor: Stefano Bergamini <bergs at live dot it>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: Quentin Foussette <quentinf7@gmail.com>
# Contributor: MetaNova

pkgname=epson-inkjet-printer-escpr
pkgver=1.7.0
pkgrel=1
pkgdesc='Epson Inkjet Printer Driver (ESC/P-R) for Linux'
arch=('x86_64')
url='http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX'
license=('GPL2')
depends=('cups' 'ghostscript')
source=('https://download3.ebz.epson.net/dsc/f/03/00/09/67/52/ab42dc3d99e4cd044852d289e5a1fa829a1a480a/epson-inkjet-printer-escpr-1.7.0-1lsb3.2.tar.gz'
        'bug_x86_64.patch')
sha512sums=('1de8a5abf3b509ff34fc4f3e7f9d3fd7edb6dd37e604ed1c062324a50bbe62a74b1010f8c082a62e496094b1c9f7cdcc6408b962231b9b8906f7861038bb3abb'
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

