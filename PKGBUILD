pkgname=catbox-git
pkgver=vcs
pkgrel=1
pkgdesc='Rust wrapper for the Catbox.moe API'
url='https://github.com/APT37/catbox'
arch=('x86_64')
makedepends=('git' 'cargo' 'clang' 'mold')
license=('MIT-0')
source=("$pkgname::git+$url")
sha256sums=('SKIP')
options=('!lto')
provides=('catbox')
conflicts=('catbox' 'catbox-bin' 'catbox-bash')

build() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release
}

package() {
	cd $pkgname
	install -Dm755 'target/release/catbox' -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname"
}
