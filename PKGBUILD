# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>

pkgname='aw-watcher-media-player'
pkgver=1.1.2
pkgrel=1
pkgdesc="Watcher of system's currently playing media for ActivityWatch"
arch=(x86_64)
url="https://github.com/2e3s/aw-watcher-media-player"
license=(Unlicense)
depends=(activitywatch dbus openssl)
makedepends=(git cargo)
source=("git+$url#tag=v$pkgver")
sha512sums=('3d81076bb85e63a2ab88ca534dfe742cc1af22d39e192bee7ec082244a51fdc59be09a98a3568e4a084cc0c11a7e75bad3443f596576ba20c91d302724c633fb')

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
