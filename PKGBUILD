# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname="linutil"
pkgver=2024.09.23
pkgrel=3
pkgdesc="Chris Titus Tech's Linutil is a distro-agnostic toolbox designed to simplify everyday Linux tasks."
arch=('x86_64' 'aarch64')
url="https://github.com/ChrisTitusTech/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ChrisTitusTech/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a9150ae1020cd9c5b249d0230658ef15c0b9335a4fc177ee8e8ba45f212b73ea')
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
