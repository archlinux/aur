pkgname=kumono
pkgver=0.41.1
pkgrel=2
pkgdesc='Media ripper for coomer.su and kemono.su'
url='https://github.com/APT37/kumono'
arch=('x86_64')
makedepends=('git' 'cargo')
license=('MIT-0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('146831623c67367c0b453efb2ca731a693bf0a22d3d43f5b18f337f7c47b81ce')
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

