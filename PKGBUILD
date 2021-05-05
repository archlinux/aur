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
pkgver=1.7.10
pkgrel=1
pkgdesc='Epson Inkjet Printer Driver (ESC/P-R) for Linux'
arch=('x86_64' 'aarch64')
url='http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX'
license=('GPL2')
depends=('cups' 'ghostscript')
source=('https://download3.ebz.epson.net/dsc/f/03/00/12/68/34/82ca3e84f17410b5ec6818e5698524b1f42862cb/epson-inkjet-printer-escpr-1.7.10-1lsb3.2.tar.gz'
        'bug_x86_64.patch')
sha512sums=('3ea4272b0c6d8c13a1f02c157cf66bf13533b7cb2e83ee4f4e6677f54b90808ae6da08ef537b4ba7a79c9a2a834221e12735818e5ef4463cc5caafc736bbcd3e'
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
