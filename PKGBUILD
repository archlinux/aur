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
pkgver=1.8.10
pkgrel=1
pkgdesc='Epson Inkjet Printer Driver (ESC/P-R) for Linux'
arch=('x86_64' 'aarch64')
url='http://support.epson.net/linux/Printer/LSB_distribution_pages/en/escpr.php'
license=('GPL-2.0-or-later')
depends=('cups' 'ghostscript')
source=('https://download-center.epson.com/f/module/d3003be6-1230-4495-a683-b627604d565c/epson-inkjet-printer-escpr-1.8.10-1.src.rpm')
sha512sums=('2c9b78abe8c404c184744c883dcf11b97ab659f7b5ca7154c0766142d20cbb8933f51c7634dc08cca90299f4706918fc82880d96d6a1262f7276bec4df9ba356')
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
