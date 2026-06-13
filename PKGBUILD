# Maintainer: 3v <ventic@3v.fi>
pkgname=clipboard-sanitizer-git
pkgver=0.2.3
pkgrel=1
pkgdesc="Clipboard monitor that strips tracking parameters from URLs"
arch=('x86_64')
url="https://github.com/3ventic/clipboard-sanitizer"
license=('GPL-3.0')
depends=()
makedepends=('rust')

source=(
	"git+https://github.com/3ventic/clipboard-sanitizer.git#branch=main"
)

sha512sums=(
	"SKIP"
)

build() {
	cd "$srcdir/clipboard-sanitizer"
	cargo build --release
}

package() {
	cd "$srcdir/clipboard-sanitizer"
	install -Dm755 "target/release/clipboard-sanitizer" "$pkgdir/usr/bin/clipboard-sanitizer"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "clipboard-sanitizer.service" "$pkgdir/usr/lib/systemd/user/clipboard-sanitizer.service"
}
