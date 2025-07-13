pkgname=kumono
pkgver=0.45.1
pkgrel=1
pkgdesc='Media ripper for coomer.su and kemono.su'
url='https://github.com/APT37/kumono'
arch=('x86_64')
makedepends=('git' 'cargo')
license=('MIT-0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('22c67a67cb7f52536d70777d05c8662d8b163cf4959063141f4d44c94ccf7c39')
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

