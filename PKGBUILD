# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Willy Micieli <micieli at vivaldi.net>
pkgname=rsbadges
pkgver=1.1.5
pkgrel=2
pkgdesc="Create code badges from the comfort and safety of Rust"
url="https://gitlab.com/tangram-vision/oss/rsbadges"
license=('BSD')
depends=('rustup')
makedepends=('cargo')
provides=("rsbadges")
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
arch=('x86_64')
sha256sums=('0c975d5e289ddcab9f80ff13653e1daf01ea23914c035f57ed642495e03d16ce')

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release 
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test 
}

package() {
    cd $pkgname-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
