# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=palletizer
pkgver=0.2.4
pkgrel=1
pkgdesc="simple self hosted Cargo registry"
arch=("x86_64")
license=(BSD)
url="https://github.com/de-vri-es/palletizer-rs"

source=("$pkgname-v$pkgver.tar.gz::https://github.com/de-vri-es/palletizer-rs/archive/v$pkgver.tar.gz")
sha512sums=('9560cc38cab9025790de5589ac34231d574b535ca7c8a2e993dfc6e4d742c4202fad494971c1f1d5a753266f356b127636d9ab701f2c55236281fd92102cded0')

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
