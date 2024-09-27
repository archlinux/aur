# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname="linutil"
pkgver=2024.09.19
pkgrel=4
pkgdesc="Chris Titus Tech's Linutil is a distro-agnostic toolbox designed to simplify everyday Linux tasks."
arch=('x86_64' 'aarch64')
url="https://github.com/ChrisTitusTech/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ChrisTitusTech/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e4393f722c53e9715ce25f1d0d3eb0660a395f37c806c63e5d3d2b24a730029f')
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
