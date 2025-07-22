pkgname=kumono
pkgver=0.47.0
pkgrel=1
pkgdesc='Media ripper for coomer.su and kemono.su'
url='https://github.com/APT37/kumono'
arch=('x86_64')
makedepends=('git' 'cargo')
license=('MIT-0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c4a155ea1d7a02f3b7da1cb7a9b36e9898840d46cc2e9e9b506400e7991c7784')
options=('!lto')
provides=('kumono')
conflicts=('kumono-bin' 'kumono-git')

build() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 'target/release/kumono' -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname"
}

