# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor:  Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: James An <james@jamesan.ca>
# Contributor: Stefano Bergamini <bergs at live dot it>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: Quentin Foussette <quentinf7@gmail.com>
# Contributor: MetaNova

pkgname=epson-inkjet-printer-escpr
pkgver=1.6.40
pkgrel=1
pkgdesc='Epson Inkjet Printer Driver (ESC/P-R) for Linux'
arch=('x86_64')
url='http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX'
license=('GPL2')
depends=('cups' 'ghostscript')
source=('https://download3.ebz.epson.net/dsc/f/03/00/09/29/93/91d20550336b7a0350d6c5ac2fe460ec0125612b/epson-inkjet-printer-escpr-1.6.40-1lsb3.2.tar.gz'
        'bug_x86_64.patch')
sha512sums=('51eb5efd1538daa3508f00e58e3adfbbdc532e3a4b3afd1bc2217964a728f19db7d9f97a01d8231b723daafd1f0410e9d112fa3a5794f7dee887d33d83882643'
            'ff4f736ec884c4d2354a83c89ee535732cb414ef0c6443bdc8ec869f889f486b242d76e143ad59d61b182231697dfe3bdf68122cb8aae873a9776ce109a07dab')

prepare() {
  cd $pkgname-$pkgver

  patch -p1 < ../bug_x86_64.patch
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

