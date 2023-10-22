_pkgdir=greetd
pkgname="greetd-fakegreet"
pkgver=0.9.0
pkgrel=3
pkgdesc='Generic greeter fakegreet for debug'
arch=("x86_64")
url="https://git.sr.ht/~kennylevinsen/$_pkgdir"
license=(GPL3)
depends=("gcc-libs" "glibc")
makedepends=("cargo")

_archive="$_pkgdir-$pkgver"
source=("$_archive.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a0cec141dea7fd7838b60a52237692d0fd5a0169cf748b8f8379d8409a3768eb')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	cargo build --frozen --release --all-features
}

check() {
	cd "$_archive"
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/fakegreet"
}
