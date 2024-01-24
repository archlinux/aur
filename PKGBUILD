# Maintainer: Neil Simpson <neilsimp1@gmail.com>

pkgname=kbsrv
pkgver=0.1.0
pkgrel=1
pkgdesc="kbsrv is a tool to host a 'keyboard server' by wrapping ydotool in a TCP server"
arch=("x86_64" "aarch64" "armv7h")
url="https://gitlab.com/neilsimp1/kbsrv"
license=("GPL-3-or-later")
depends=("ydotool")
makedepends=("rust")
source=("https://gitlab.com/neilsimp1/kbsrv/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("0ccbf9f19d148bcdb89a436084d8d2c144f248151b0f24de9f2a3a515ff10bc6")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --frozen --release
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/"$pkgname"
	install -Dm755 kbsrvd.sh "$pkgdir"/usr/lib/"$pkgname"/kbsrvd.sh
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
	install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
	install -Dm644 kbsrvd.service "$pkgdir"/usr/lib/systemd/system/kbsrvd.service
}
