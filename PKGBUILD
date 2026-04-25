# Maintainer: Jonathan Grotelüschen <tippfehlr@archlinux.org>

pkgname=aw-watcher-media-player
pkgver=1.1.4
pkgrel=1
pkgdesc="Watcher of system's currently playing media for ActivityWatch"
arch=('x86_64')
url="https://github.com/2e3s/aw-watcher-media-player"
license=('Unlicense')
depends=('activitywatch' 'dbus' 'openssl')
makedepends=('git' 'cargo')
source=("git+$url#tag=v$pkgver")
sha256sums=('1e8a2a6572d7b4c649ec045d21e96a0152b892041b464a855f10fe36755225cb')

prepare() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd $pkgname
	install -Dm755 target/release/aw-watcher-media-player -t "$pkgdir/usr/bin/"
	install -Dm644 visualization/index.html -t "$pkgdir/usr/share/$pkgname/visualization/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
