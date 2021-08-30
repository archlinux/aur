# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=palletizer
pkgver=0.1.2
pkgrel=1
pkgdesc="simple self hosted Cargo registry"
arch=("x86_64")
license=(BSD)
url="https://github.com/de-vri-es/palletizer-rs"

source=("$pkgname-v$pkgver.tar.gz::https://github.com/de-vri-es/palletizer-rs/archive/v$pkgver.tar.gz")
sha512sums=('a7237795cfe1d3524dbe95e0a72e55f164b0039d8b6d742b59ee71665ce2937c25786cba7b117e7374507b4e1952c52ae5c643cd025372d59a994c29c5e3dd09')

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
