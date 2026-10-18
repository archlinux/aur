# Maintainer: Gabriel M. Dutra <gabrieldutra@tutanota.com>

pkgname=dz6
pkgver=0.8.0
pkgrel=1
pkgdesc='Fast Vim-inspired TUI hex editor'
url='https://github.com/mentebinaria/dz6'
license=('GPL-3.0')
makedepends=('cargo')
depends=('gcc-libs')
arch=('x86_64' 'armv6h' 'armv7h')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('196948d70401b156c84ace04c0328361d1e883520417bf5cf0fb4638c90833ec')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    # for custom license, e.g. MIT
    # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
