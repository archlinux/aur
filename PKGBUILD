# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator
pkgver=1.9.3
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('x86_64')
url="https://github.com/iNavFlight/inav-configurator"
makedepends=('yarn')
source=(https://github.com/iNavFlight/inav-configurator/archive/1.9.3.zip
        inav-configurator.desktop)
md5sums=('be04aa017fbeefbf0db08d42686e2dbf'
         'a84590640d45f59f9710480a9ac78a84')
provides=('inav-configurator')
conflicts=('inav-configurator')
options=(!strip)
license=('GPL3')

build() {
	cd $pkgname-$pkgver
	yarn install
	./node_modules/.bin/gulp release-only-linux
}

package() {
	cd $pkgname-$pkgver/apps/inav-configurator/linux64/
	install -d "$pkgdir/opt/inav/inav-configurator/"
	cp -r * "$pkgdir/opt/inav/inav-configurator/"

	install -Dm644 "$srcdir/inav-configurator.desktop" "$pkgdir/usr/share/applications/inav-configurator.desktop"
	install -Dm644 "$srcdir/$pkgname-$pkgver/images/inav_icon_128.png" "$pkgdir/opt/inav/inav-configurator/icon/inav_icon_128.png"

	install -d "$pkgdir/usr/bin/"
	ln -s /opt/inav/inav-configurator/inav-configurator "$pkgdir/usr/bin/inav-configurator"
}