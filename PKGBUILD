# Maintainer: Guillaume Michaud <michaudg@gmail.com>

pkgname=xow
pkgver=0.5
pkgrel=2
pkgdesc='Linux driver for the Xbox One wireless dongle'
arch=('x86_64')
url='https://github.com/medusalix/xow'
license=('GPL2')
depends=('libusb' 'cabextract')
conflicts=('xow-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/medusalix/xow/archive/v$pkgver.tar.gz")
md5sums=('37193261c48ec5d3e703f5a045e7427f')

build() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr BUILD=RELEASE
	make PREFIX=/usr BUILD=RELEASE xow.service
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR=$pkgdir/ SYSDDIR=/usr/lib/systemd/system install

    echo ""
    echo "To enable and start the service:"
    echo -e "\e[33msystemctl enable --now xow.service"
    echo ""
    echo -e "\e[33mA reboot might be required for xow to work correctly."
    echo ""
}
