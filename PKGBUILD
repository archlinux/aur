pkgname=catbox
pkgver=0.9.2
pkgrel=3
pkgdesc='Rust wrapper for the Catbox.moe API'
url='https://github.com/APT37/catbox'
arch=('x86_64')
makedepends=('git' 'cargo' 'clang' 'mold')
license=('MIT-0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b05ae1584027b07e41495e47876c7ab8f5f78a5ba93912f29ac367af5e35505c')
options=('!lto')
provides=('catbox')
conflicts=('catbox-bin' 'catbox-git' 'catbox-bash')

build() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname"
}

