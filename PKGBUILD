pkgname=catbox
pkgver=0.9.0
pkgrel=1
pkgdesc='Rust wrapper for the Catbox.moe API'
url='https://github.com/APT37/catbox'
arch=('x86_64')
makedepends=('git' 'cargo' 'clang' 'mold')
license=('MIT-0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ba8767886022de33f9c7154aebac67308435c1368644fb2ebd1ca867bb5ae898')
options=('!lto')

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

