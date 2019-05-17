# Maintainer: Bruce Zhang
pkgname=simplenote-electron
pkgver=1.5.0
pkgrel=1
pkgdesc="A Simplenote React app packaged via Electron for Windows and Linux"
arch=('x86_64' 'i686')
url="https://github.com/Automattic/simplenote-electron"
license=('GPL')
depends=('electron')
provides=('simplenote-electron')
conflicts=('simplenote-electron-bin')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/Automattic/simplenote-electron/archive/v$pkgver.tar.gz")
sha256sums=('5103b61db4cb6c4ea2f4359ec00560d16be7d32cf32612a2985c76fbd2488d64')

prepare() {
	cd "$pkgname-$pkgver"
	electronVersion=$(cat /usr/lib/electron/version)
	electronDist="\/usr\/lib\/electron"

	sed -i "s/\"electron\": \".*/\"electron\": \"$electronVersion\",/" "$srcdir/$pkgname-$pkgver/package.json"
	sed -i "s/electronVersion,/electronDist: \"$electronDist\", electronVersion: \"$electronVersion\",/" "$srcdir/$pkgname-$pkgver/builder.js"
}

build() {
	cd "$pkgname-$pkgver"
	HOME="$srcdir/.electron-gyp" npm install
	make build
	./node_modules/.bin/electron-builder -l --dir
}

package() {
	cd "$pkgname-$pkgver"
}
