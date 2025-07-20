# Maintainer: Frederick Price <fprice@pricemail.ca>

pkgname=csvargs
pkgver=0.3.0
pkgrel=1
pkgdesc="A command-line tool for processing CSV files with Jinja2 templates and executing commands on each row"
arch=('x86_64')
url="https://github.com/rickprice/csvargs"
license=('BSD-3-Clause')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rickprice/csvargs/archive/v$pkgver.tar.gz")
sha256sums=('716ca5ae2e1508e35fe7d3a3b479fe634ac904048a041ccea18e9dfd7aa0ecd6')

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
