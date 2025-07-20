# Maintainer: Frederick Price <fprice@pricemail.ca>

pkgname=csvargs
pkgver=0.3.1
pkgrel=1
pkgdesc="A command-line tool for processing CSV files with Jinja2 templates and executing commands on each row"
arch=('x86_64')
url="https://github.com/rickprice/csvargs"
license=('BSD-3-Clause')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rickprice/csvargs/archive/v$pkgver.tar.gz")
sha256sums=('66e6c0db46ddf103268ca56c30313d4bc1fe6bf8f954bef677b0937580498b25')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
    cargo test --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
