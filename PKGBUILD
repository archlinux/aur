# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname="linutil"
pkgver=2024.09.22
pkgrel=1
pkgdesc="Chris Titus Tech's Linutil is a distro-agnostic toolbox designed to simplify everyday Linux tasks."
arch=('x86_64' 'aarch64')
url="https://github.com/ChrisTitusTech/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ChrisTitusTech/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('78c8aa11da2e2c5c9dad36b4b6a4d0f9316f49450406047b00c305b3ed38672a')
makedepends=('rustup' 'glibc' 'gcc-libs')
depends=('git' 'pacman')
optdepends=('ttf-nerd-fonts-symbols: symbols and icons')

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$pkgname-$pkgver"

    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$pkgname-$pkgver"

    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
