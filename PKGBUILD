pkgname=catbox
pkgver=0.9.0
pkgrel=1
pkgdesc='Rust wrapper for the Catbox.moe API'
url='https://github.com/APT37/catbox'
arch=('x86_64')
makedepends=('git' 'cargo' 'clang' 'mold')
license=('MIT-0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('139672256ad1bab30d9ccd5654c124a1a1f90991a6b3ebbf4a00e9191379f044')
options=('!lto')
provides=('catbox')
conflicts=('catbox-bin' 'catbox-git')

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

