# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Nícolas Bordignon dos Santos <nicolas.bordignon16@gmail.com>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: James An <james@jamesan.ca>
# Contributor: Stefano Bergamini <bergs at live dot it>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: Quentin Foussette <quentinf7@gmail.com>
# Contributor: MetaNova

pkgname=epson-inkjet-printer-escpr
pkgver=1.8.9
pkgrel=1
pkgdesc='Epson Inkjet Printer Driver (ESC/P-R) for Linux'
arch=('x86_64' 'aarch64')
url='http://support.epson.net/linux/Printer/LSB_distribution_pages/en/escpr.php'
license=('GPL-2.0-or-later')
depends=('cups' 'ghostscript')
source=('https://download-center.epson.com/f/module/8fbe3731-bcfd-4bab-bf48-533c05cc64d4/epson-inkjet-printer-escpr-1.8.9-1.src.rpm')
sha512sums=('d8f765c97402ba43b9d2bd6be1bcf1a673edfb34916334d8c1f55a84315aa7cf58e0aeaf1816c29b79fa833cf9f334c08b9335d0438823ca11d8dd73ee41a53d')
DLAGENTS=('https::/usr/bin/curl --user-agent Firefox -qgb "" -fLC - --retry 3 --retry-delay 3 -o %o %u')


prepare() {
  tar xzf "${pkgname}-${pkgver}-1.tar.gz"
  cd "${pkgname}-${pkgver}"
  autoreconf -vif
}

build() {
  cd "${pkgname}-${pkgver}"

  CFLAGS="${CFLAGS} -Wno-implicit-function-declaration"

  ./configure \
  	--prefix=/usr \
  	--with-cupsfilterdir=/usr/lib/cups/filter \
  	--with-cupsppddir=/usr/share/ppd

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
