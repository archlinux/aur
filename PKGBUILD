# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=rustmission
pkgver=0.5.0
pkgrel=2
pkgdesc='Performant TUI for Transmission capable of managing hundreds of torrents.'
url='https://github.com/intuis/rustmission'
license=(GPL-3.0-or-later)
makedepends=('cargo')
depends=()
optionaldepends=(ttf-font-nerd: Nerd Font for icons)
arch=('x86_64')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('64367f367c5b8770ff088c84a451975538bc866c12bca89f6e01c71b17b790776f78bc113935bea703252ad3a8e83eadcc74d2118ae3044b3f809a271f7ec630')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
