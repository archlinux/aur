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
pkgver=1.7.23
pkgrel=1
pkgdesc='Epson Inkjet Printer Driver (ESC/P-R) for Linux'
arch=('x86_64' 'aarch64')
url='http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX'
license=('GPL2')
depends=('cups' 'ghostscript')
source=('https://download3.ebz.epson.net/dsc/f/03/00/14/28/57/c3d715c6f50ec33c7a51183e453d21189f9cdcf4/epson-inkjet-printer-escpr-1.7.23-1lsb3.2.tar.gz'
        'bug_x86_64.patch')
sha512sums=('d74a20b84f33a49781ed50f3ad0f5085776b129489e3e120eea9d0a1734d73b6fd7d98816ce6ef2aa178eba23460c06492437717622f35e56c932a1f25af64ff'
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
