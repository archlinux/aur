# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=quad-bot
pkgver=0.1
pkgrel=0
pkgdesc="Discord Bot"
arch=("any")
url="https://github.com/vicr123/quad"
license=('GPL3')
depends=('nodejs')
makedepends=('gulp')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/quad.git' 'check.js' 'local.json')
install=quad.install
sha256sums=('SKIP'
	'5db8b740c61cc4cc3ecbbd682f3104197300937642edad8ce3bcfcab67d89713'
	'SKIP')

prepare() {
	node check.js
	cp "local.json" "$pkgname-$pkgver/config"

	cd "$pkgname-$pkgver"
	npm install
}

package() {
	cd "$pkgname-$pkgver"
	export DESTDIR=$pkgdir
	gulp install
}
