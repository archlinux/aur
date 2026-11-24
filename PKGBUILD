# Maintainer: Jonathan Grotelüschen <tippfehlr@archlinux.org>

pkgname=ravedude
pkgver=0.3.0
pkgrel=1
pkgdesc="avrdude wrapper for embedded rust development"
url="https://github.com/Rahix/avr-hal/tree/main/ravedude"
license=("MIT OR Apache-2.0")
arch=("x86_64" "aarch64")
# this fetches all of avr-hal. An alternative could be crates.io, but the license would be missing.
source=("git+https://github.com/Rahix/avr-hal#tag=ravedude-$pkgver")
depends=("avrdude" "systemd-libs" "glibc" "libgcc")
makedepends=("git" "cargo")
sha512sums=('ce91af211b7c7a61ec17c04ead30ddb57eb51a2dc7dc3e5d921759b6929d2d03fe2d7f918a813145dff88e74c3ccf59f3c1a1ce614b962c859398d6c9583902f')

prepare() {
	cd avr-hal/ravedude
	cargo fetch --locked --target host-tuple
}

build() {
	cd avr-hal/ravedude
	cargo build --frozen --release --all-features
}

package() {
	cd avr-hal/ravedude
	install -Dm755 target/release/ravedude -t "$pkgdir/usr/bin/"
	install -Dm644 ../LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
}
