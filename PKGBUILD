pkgname="sb"
pkgver="0.1.0"
pkgrel="1"
pkgdesc="A command-line tool to search binaries in Unix-like systems"
arch=("any")

url="https://github.com/siaeyy/sb"
license=('MIT')

depends=("glibc")
makedepends=("rust" "cargo")

# For display the descriptions of the binaries
# man-db and groff is required
optdepends=(
    "man-db: For binary descriptions"
    "groff: For binary descriptions"
)

source=("https://github.com/siaeyy/sb/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d269d56ee12990afa13d196317dea36f1eb0ba21ae4960c027e4c049662f4170')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}