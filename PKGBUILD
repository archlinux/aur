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
pkgver=1.7.17
pkgrel=1
pkgdesc='Epson Inkjet Printer Driver (ESC/P-R) for Linux'
arch=('x86_64' 'aarch64')
url='http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX'
license=('GPL2')
depends=('cups' 'ghostscript')
source=('https://download3.ebz.epson.net/dsc/f/03/00/12/99/78/73605b3f8aac63694fdabee6bd43389731696cd9/epson-inkjet-printer-escpr-1.7.17-1lsb3.2.tar.gz'
        'bug_x86_64.patch')
sha512sums=('b28cd7aec0ab64adc0f483abd9d1c21b582cf4f71df4bdd4f04b4258d497a649b3655158ec08b951abb3958dc8b3c14bf202b810b8a8e7ad8597a5c47ac9a1fc'
            '91354f7087bc9f8a9591336ee49b60bd947030ee2cf5152ba5ca117d73e6cdeca2fbdfe090478ae362aba0d021ed1ae06646a443f7ed859278ceb5cd207e2788')


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
