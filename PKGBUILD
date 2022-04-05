# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

_cratename=melody_cli
pkgname=melody
pkgver=0.13.10
pkgrel=1
pkgdesc='A language designed to compile to and maintain a 1-1 relationship with regular expressions, while being more readable and maintainable.'
url='https://github.com/yoav-lavi/melody'
makedepends=('cargo')
depends=('gcc-libs')
arch=('x86_64')
license=('MIT')
source=("https://github.com/yoav-lavi/melody/archive/v${pkgver}/v${pkgver}.tar.gz")
sha256sums=('1922d6d668d2107c83f9fa729a1e37701920296640b5fce14a732c62840ffd00')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu" --manifest-path "crates/${_cratename}"/Cargo.toml
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features --package "${_cratename}"
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

