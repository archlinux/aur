pkgname=kumono-git
pkgver=vcs
pkgrel=1
pkgdesc='Media ripper for coomer.su and kemono.su'
url='https://github.com/APT37/kumono'
arch=('x86_64')
makedepends=('git' 'cargo' 'clang' 'mold')
license=('MIT-0')
source=("$pkgname::git+$url")
sha256sums=('SKIP')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-bin')

build() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release
}

package() {
	cd $pkgname
	install -Dm755 'target/release/kumono' -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname"
}
