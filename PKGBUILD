# Maintainer: Neil Simpson <neilsimp1@gmail.com>

pkgname=kbsrv
pkgver=0.2.0
pkgrel=1
pkgdesc="kbsrv is a tool to host a 'keyboard server' by wrapping ydotool in a TCP server"
arch=("x86_64" "aarch64" "armv7h")
url="https://gitlab.com/neilsimp1/kbsrv"
license=("GPL-3-or-later")
depends=("ydotool")
makedepends=("rust")
source=("https://gitlab.com/neilsimp1/kbsrv/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("e58808c144a23d9d4466a51da37c85e161a1d13602f0dcf26c5c19239f6c53c8")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/"$pkgname"
	install -Dm755 kbsrvd.sh "$pkgdir"/usr/lib/"$pkgname"/kbsrvd.sh
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
	install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
	install -Dm644 kbsrvd.service "$pkgdir"/usr/lib/systemd/system/kbsrvd.service
}
