# Maintainer: Muhammad Nu'man <numany2k2005@gmail.com>
pkgname=talabulilm
pkgver=1.3.1
pkgrel=1
pkgdesc="Watch Ceramah Ustaz (Islamic lectures) from the terminal, a full-screen TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/numan89/talabulilm"
license=('MIT')
depends=('yt-dlp' 'mpv')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/numan89/talabulilm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('93ca88639c0681d0f4dd12c4e3a260aa707e22db27ff8788e1b7884ec40eecf6')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
