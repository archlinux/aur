# Maintainer: Cryptic <crypticversemc@gmail.com>

pkgname=pacman-command-utils
pkgver=0.1.0
pkgrel=2
pkgdesc="Command utils to help out long pacman commands"
arch=('x86_64')
url="https://github.com/crypticverse/pacman-command-utils"
license=('MIT')
makedepends=('rust')
depends=('pacman')
source=("$pkgname-$pkgver.tar.gz::https://github.com/crypticverse/pacman-command-utils/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('186850dfbcdd91abf8ec394eaf47e516fea0896def1bc32b479bd4fe165b04db')

prepare() {
    cd "$pkgname-$pkgver/"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname-$pkgver/"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver/"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver/"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/pacman-autoremove"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
