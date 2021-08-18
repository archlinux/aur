# Maintainer: ninni <soelder@hotmail.com>
pkgname=awakened-poe-trade-git
pkgver=v2.13.1.r1.fc69988
pkgrel=2
pkgdesc='Path of Exile trading app for price checking'
arch=('any')
url='https://github.com/SnosMe/awakened-poe-trade'
license=('MIT')
depends=()
makedepends=('git' 'yarn' 'node-gyp')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip)
source=('git+https://github.com/SnosMe/awakened-poe-trade.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/awakened-poe-trade"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/awakened-poe-trade"
	yarn
	yarn electron:build
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cd "$srcdir/awakened-poe-trade/dist_electron/"
	cp *.AppImage "$pkgdir/usr/bin/awakened-poe-trade"
}
