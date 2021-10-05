# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=palletizer
pkgver=0.2.3
pkgrel=1
pkgdesc="simple self hosted Cargo registry"
arch=("x86_64")
license=(BSD)
url="https://github.com/de-vri-es/palletizer-rs"

source=("$pkgname-v$pkgver.tar.gz::https://github.com/de-vri-es/palletizer-rs/archive/v$pkgver.tar.gz")
sha512sums=('9049df5a388a957630dec8b4c5d3a4d2604e6247e324710b047e91f501227472a45f7676cb98679e24f686392eec2750e9e08fb89ea877fbd307128154c6c87f')

depends=(openssl zlib)
makedepends=(rust)

_dir="$pkgname-rs-$pkgver"

build() {
	cd "$_dir"
	cargo build --release --workspace
}

package() {
	cd "$_dir"
	install -m 755 -Dt "$pkgdir/usr/bin/" target/release/{palletizer,palletizer-server}
	install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE.md"
}

check() {
	cd "$_dir"
	cargo test --release --workspace
}
