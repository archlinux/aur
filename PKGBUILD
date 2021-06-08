# Maintainer: Gleb Sinyavskiy <zhulik.gleb@gmail.com>
pkgname=system-bridge
pkgver=1.7.0
pkgrel=1
pkgdesc="A bridge for your systems."
arch=('any')
url="https://github.com/timmo001/system-bridge"
license=('MIT')
makedepends=("yarn" "node-gyp")
source=("https://github.com/timmo001/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "system-bridge.desktop")
sha256sums=("320ed6bd42b15a3f77350731eae6b20320d5844123360fb366e2d569eb2cef51"
            "88aa544901a54eef3052f4d79fdd5278a5fa3ca220e3ff1daa486b176d552ee5")

build() {
	cd "$pkgname-$pkgver"
	yarn install:all
	yarn package
}

package() {
	mkdir "$pkgdir/opt"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications/"
	mkdir -p "$pkgdir/usr/share/icons/"

	cp -r "$pkgname-$pkgver/out/system-bridge-linux-x64" "$pkgdir/opt/$pkgname"
	ln -s "$pkgdir/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/"

	cp system-bridge.desktop "$pkgdir/usr/share/applications/"
	cp "$pkgname-$pkgver/public/system-bridge.svg" "$pkgdir/usr/share/icons/"
}
