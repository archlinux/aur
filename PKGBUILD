# Maintainer: taotieren <admin@taotieren.com>

pkgname=mdbook-compress
pkgver=0.2.1
pkgrel=0
pkgdesc="An mdBook single PDF generator using pure Rust and some Node.js"
arch=('any')
url="https://github.com/RosiePuddles/mdbook-compress"
license=('MLP-2.0')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=()
makedepends=('cargo')
optdepends=('mdbook: Create book from markdown files, like Gitbook but implemented in Rust')
backup=()
options=()
install=
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('28b232b5b37a408c2282fa253ff4e707c00ca33b88cc95a7b22a38f3b7c89587')

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${srcdir}/${pkgname}-${pkgver}/"
    cargo build --release
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${srcdir}/${pkgname}-${pkgver}/"
    cargo test --release
}

package() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable

    cargo install --no-track --root "$pkgdir/usr/" --path .
}
