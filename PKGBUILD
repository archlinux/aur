# Maintainer  : Willy Micieli <micieli@vivaldi.net>
# Contributor : Willy Micieli <micieli@vivaldi.net>

pkgname=continuous-testing
pkgver=2.0.0
pkgrel=1
pkgdesc="A continuous integration testing project"
provides=("again")
arch=('any')
url="https://github.com/taishingi/continuous-testing"
license=('GPL3')
depends=('packer' 'libnotify' 'curl' 'fuse-overlayfs' 'less' 'rustup' 'fd' 'git')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('d545f57571c48d09ff62cfea8ecd78626f90c62e6237431277e499798535d435')

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/again"
}
