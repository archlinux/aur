# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=palletizer
pkgver=0.2.7
pkgrel=1
pkgdesc="simple self hosted Cargo registry"
arch=("x86_64")
license=(BSD-2-Clause)
url="https://github.com/de-vri-es/palletizer-rs"

source=("$pkgname-v$pkgver.tar.gz::https://github.com/de-vri-es/palletizer-rs/archive/v$pkgver.tar.gz")
sha512sums=('df710dbdc18fc99188694882c8e6a0e6821fce8b68e97b3eac000e957f0c0c9d33116313e46fd69dfff7218d7dd2d2a70627ca6b13c6df21f55455270f351e7e')

depends=(openssl zlib)
makedepends=(rust)
options=(!lto)

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
