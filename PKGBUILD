# Maintainer: Gleb Sinyavskiy <zhulik.gleb@gmail.com>
pkgname=system-bridge
pkgver=1.7.2
pkgrel=2
epoch=1
pkgdesc="A bridge for your systems."
arch=('any')
url="https://github.com/timmo001/system-bridge"
license=('MIT')
depends=("libxss" "gtk3" "nss")
makedepends=("yarn" "node-gyp")
source=("https://github.com/timmo001/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "system-bridge.desktop"
        "$pkgname"
				)
sha256sums=("79faf9ee7f4c9d90c14a94c0e897fd2365b3bd9ba6390435964b9c78221884b6"
            "88aa544901a54eef3052f4d79fdd5278a5fa3ca220e3ff1daa486b176d552ee5"
            "533cf83f0edd65cc49eee508afb521fc06e393758c5af02d59f7cf8d936b6698")

build() {
	cd "$pkgname-$pkgver"

	yarn install:all
	yarn package
}

package() {
	mkdir -p "$pkgdir/opt"

	cp -r "$pkgname-$pkgver/out/$pkgname-linux-x64" "$pkgdir/opt/$pkgname"
	chmod -R 755 "/opt/$pkgname"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$pkgname-$pkgver/public/$pkgname.svg" "$pkgdir/usr/share/icons/$pkgname.svg"
}
