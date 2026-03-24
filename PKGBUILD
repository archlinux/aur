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
pkgver=1.8.8
pkgrel=1
pkgdesc='Epson Inkjet Printer Driver (ESC/P-R) for Linux'
arch=('x86_64' 'aarch64')
url='http://support.epson.net/linux/Printer/LSB_distribution_pages/en/escpr.php'
license=('GPL-2.0-or-later')
depends=('cups' 'ghostscript')
source=('https://download-center.epson.com/f/module/e934c1f6-0fc1-43e5-8d3e-0de8f3a3d357/epson-inkjet-printer-escpr-1.8.8-1.src.rpm')
sha512sums=('85bcaff840fe4dfb256b42e5625e221ad273881b7bbeefafc53cff96ab4ddb91e0045fdfcdcf9e53a469385ec524077bfc40051429fba205b659c95741168a51')
DLAGENTS=('https::/usr/bin/curl --user-agent Firefox -qgb "" -fLC - --retry 3 --retry-delay 3 -o %o %u')


prepare() {
  cd $srcdir

  tar xzf $pkgname-$pkgver-1.tar.gz
  cd $pkgname-$pkgver
  autoreconf -vif
}

build() {
  cd $pkgname-$pkgver

  CFLAGS="${CFLAGS} -Wno-implicit-function-declaration"

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
