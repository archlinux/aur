# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname="linutil"
pkgver=2024.09.18
pkgrel=3
pkgdesc="Chris Titus Tech's Linutil is a distro-agnostic toolbox designed to simplify everyday Linux tasks."
arch=('x86_64')
url="https://github.com/ChrisTitusTech/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ChrisTitusTech/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5c862aeaf88ccf9daaf23fc1fc9a50fec5fda1e7681956575c78ff173673306a')
makedepends=(rustup)
depends=('git' 'pacman' 'glibc' 'gcc-libs')
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
