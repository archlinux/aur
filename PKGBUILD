# Maintainer: Jake <aur@ja-ke.tech>
# Contributor Jordan Day < jordanday444 at gmail dot com >

pkgname=betaflight-configurator
pkgver=10.3.1
pkgrel=5
pkgdesc="Crossplatform configuration tool for the Betaflight flight control system"
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator"
license=('GPL3')
depends=('nwjs-bin')
makedepends=('yarn' 'npm')
source=("https://github.com/betaflight/betaflight-configurator/archive/$pkgver.zip"
        "$pkgname.sh"
        "$pkgname.desktop")
sha512sums=('9825905a4cb408ef39d01490ab9da238cf9482527b8ecbf1277838a1e09428f4701d8709eebf443f94897f3ea9bd40ad411f3388ce14f1a2fd067353c6c45a12'
            '9d4c372a891644c4f4bf5d359dc2bfca35883e0e26fce8567dd791d8dbb6f2254792879c754426093a95603d6caac387c611bf9c70749cfd3e0f5c3abc1f6c29'
            '79e5ab59cf8520ce7e20fb2bd89ee99ce3debba69e7da892bf219912cc32c7056a7c8fd6dae19eebfe4956c948d0bc75ece40911b203fcc2f34e43f2d8329532')
options=(!strip)
install=$pkgname.install

build() {
	cd $pkgname-$pkgver
	yarn install
	./node_modules/.bin/gulp dist --linux64
}

package() {
	cd $pkgname-$pkgver
	install -d "$pkgdir/usr/share/$pkgname/"
	cp -r dist/* "$pkgdir/usr/share/$pkgname/"
	install -D "assets/linux/icon/bf_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -D "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	
	install -d "$pkgdir/usr/bin/"
	install -Dm 755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
