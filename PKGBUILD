# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgname=topiary
pkgver=0.6.0
pkgrel=1
pkgdesc='The universal code formatter'
arch=('x86_64')
url='https://topiary.tweag.io/'
license=(MIT)
depends=(glibc gcc-libs)
makedepends=(cargo)

source=("$pkgname-$pkgver.tar.gz::https://github.com/tweag/topiary/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d0cc71693a1d889e6031eb9b0ad453f50bfde4a9bbe58a2294b9d2c88449a06c')

export RUSTUP_TOOLCHAIN=stable
export CARGO_TARGET_DIR=target
export CARGO_BUILD_TARGET="$CARCH-unknown-linux-gnu"

prepare() {
    cd "$pkgname-$pkgver"

    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"

    cargo build --frozen --release --bin topiary
}

check() {
    cd "$pkgname-$pkgver"

    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

