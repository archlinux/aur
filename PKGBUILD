# Maintainer: Agatha Zeren <agatha@zeren.com>

pkgname=tera-cli
pkgver=0.5.0
pkgrel=1
pkgdesc="CLI to make one-off Tera templating easier"
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('teracli')
arch=('x86_64')
url="https://github.com/guangie88/tera-cli"
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6a9bcb8cc0cdb65fa2ec5100d94be495859534abb19b6b08fe182f3825779744')
license=('MIT')


prepare() {
    cd $pkgname-$pkgver
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd $pkgname-$pkgver
    ls
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/tera"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}


