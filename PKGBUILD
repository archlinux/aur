# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=palletizer
pkgver=0.2.6
pkgrel=1
pkgdesc="simple self hosted Cargo registry"
arch=("x86_64")
license=(BSD-2-Clause)
url="https://github.com/de-vri-es/palletizer-rs"

source=("$pkgname-v$pkgver.tar.gz::https://github.com/de-vri-es/palletizer-rs/archive/v$pkgver.tar.gz")
sha512sums=('490c1b130aea66f1bd9e72390bc14d5151291839186d44c034fd6dbdc1c00102cadc6858282641bef675ba33e1039ff94160f6516d72c1fef33441f77c74de2b')

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
