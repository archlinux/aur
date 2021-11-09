# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Francisco Carvajal <fraco_oxza@outlook.com>
pkgname=dreadnought-git
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="A lightweight, simple and configurable web server "
arch=('x86_64')
url="https://github.com/fraco-oxza/dreadnought"
license=('MIT')
groups=()
depends=()
makedepends=("cargo")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/fraco-oxza/dreadnought/archive/v$pkgver.tar.gz")
noextract=()
sha256sums=("f4f30479ede4fa624af9968f0f1b0e3c6420392bfb0d4b7f01e5d8f46066461a")

prepare() {
    cd dreadnought-$pkgver
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd dreadnought-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd dreadnought-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd dreadnought-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/dng"
}
