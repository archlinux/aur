# Maintainer: Wilhelm Jochim <whjochim@gmail.com>
pkgname=xwacomcalibrate
pkgver=1.0
pkgrel=1
arch=("any")
pkgdesc="calibrates wacom tablets to the current window"
url="https://github.com/whjochim/xwacomcalibrate"
license=("GPL")
depends=("xdotool" "xf86-input-wacom" "xorg-xwininfo")
makedepends=("rust" "cargo" "git")
provides=(xwacomcalibrate)
source=("$pkgname::git+https://github.com/whjochim/xwacomcalibrate#branch=master")
sha256sums=("SKIP")

build() {
	cd "$pkgname"
	cargo build --release --locked --all-features
}

check() {
	cd "$pkgname"
	cargo test --release --locked
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm 755 target/release/${pkgname} -t "$pkgdir/usr/bin"
	install -Dm 755 LICENSE "$pkgdir/usr/share/$pkgname/LICENSE"
}
