# Maintainer: Jian Wei Cheong <aur at jianwei dot anonaddy dot com>

pkgname=bibiman
pkgver=0.13.0
pkgrel=1
pkgdesc='A TUI for fast and simple interacting with your BibLaTeX database.'
url='https://codeberg.org/lukeflo/bibiman'
license=('GPL-3.0-or-later')
makedepends=('cargo')
provides=('bibiman')
arch=('x86_64')
options=(!debug !lto)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('b8a430021da541354f51a298266d0fe0c760b9da54a7965ee40dd4023dabd4410833d075081f0687390ccb91f9883fce7747de81e1e64e368bd7932f15e5e89b')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd $pkgname-$pkgver
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd $pkgname-$pkgver
    cargo build --frozen --release --all-features
}

# check() {
#     export RUSTUP_TOOLCHAIN=stable
#     cd $pkgname-$pkgver
#     cargo test --frozen --all-features
# }

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
