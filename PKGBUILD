# Maintainer: GitanElyon gitanelyon@gmail.com

pkgname=qst
pkgver=0.11.0
pkgrel=1
pkgdesc="A Community Driven CLI Quick Script Tool"
url="https://github.com/GitanElyon/qst"
license=("MIT")
makedepends=('cargo')
arch=("x86_64")
provides=("qst")
conflicts=("qst")
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('1553d63bd96c362442356970e618d6b8a7b1122b5eb48481eed3f11c5cbf4024')


prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname-$pkgver/target/release/$pkgname"
    install -Dm0644 "$srcdir/$pkgname-$pkgver/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
