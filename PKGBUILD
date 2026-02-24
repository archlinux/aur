# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>

pkgname='aw-watcher-media-player'
pkgver=1.1.3
pkgrel=1
pkgdesc="Watcher of system's currently playing media for ActivityWatch"
arch=(x86_64)
url="https://github.com/2e3s/aw-watcher-media-player"
license=(Unlicense)
depends=(activitywatch dbus openssl)
makedepends=(git cargo)
source=("git+$url#tag=v$pkgver")
sha512sums=('931fbb031116bfb32588aa93fd6ff641282896e92e3677d7b09104e7ac199a8448bb28050e01c78f0bb70b05f4ae14c9745732aeaf2881df0de3f14a2a66b14f')

prepare() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target $(rustc --print host-tuple)
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
