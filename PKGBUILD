# Maintainer: Jake <aur@ja-ke.tech>
# Contributor Jordan Day < jordanday444 at gmail dot com >

pkgname=betaflight-configurator
pkgver=10.3.1
pkgrel=4
pkgdesc="Crossplatform configuration tool for the Betaflight flight control system"
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator"
license=('GPL3')
makedepends=('yarn')
source=("https://github.com/betaflight/betaflight-configurator/archive/$pkgver.zip")
sha512sums=('9825905a4cb408ef39d01490ab9da238cf9482527b8ecbf1277838a1e09428f4701d8709eebf443f94897f3ea9bd40ad411f3388ce14f1a2fd067353c6c45a12')
options=(!strip)
install=$pkgname.install

build() {
	cd $pkgname-$pkgver
	yarn install
	./node_modules/.bin/gulp apps --linux64
}

package() {
	cd $pkgname-$pkgver/apps/$pkgname/linux64/
	install -d "$pkgdir/opt/betaflight/$pkgname/"
	cp -r * "$pkgdir/opt/betaflight/$pkgname/"
	install -D "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	
	install -d "$pkgdir/usr/bin/"
	ln -s /opt/betaflight/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
}
