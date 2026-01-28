# Maintainer: Cryptic <crypticversemc@gmail.com>

pkgname=pacman-command-utils
pkgver=0.1.0
pkgrel=1
pkgdesc="Command utils to help out long pacman commands"
arch=('x86_64')
url="https://github.com/crypticverse/pacman-command-utils"
license=('MIT')
makedepends=('rust')
depends=('pacman')
source=("$pkgname-$pkgver.tar.gz::https://github.com/crypticverse/pacman-command-utils")
sha256sums=('8e449bbf4e8f459e7e78d8138304070482bf0e1cdaee24bfcbd55d8444584834')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/pacman-autoremove"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
