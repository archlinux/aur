# Maintainer: Jian Wei Cheong <aur at jianwei dot anonaddy dot com>

pkgname=bibiman
pkgver=0.16.3
pkgrel=1
pkgdesc='A TUI for fast and simple interacting with your BibLaTeX database.'
url='https://codeberg.org/lukeflo/bibiman'
license=('GPL-3.0-or-later')
makedepends=('cargo')
provides=('bibiman')
conflicts=('bibiman-bin' 'bibiman-git')
arch=('x86_64')
options=(!debug !lto)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/lukeflo/bibiman/archive/v$pkgver.tar.gz")
b2sums=('20d65e4a0c71ef8bde491868770433d1c8d97b3eb3d7660fa68f7f63ce904fc2cf475e09ef3fc03edc51d6693b23cf8dd9e299cc8f2835557e57d2a391ae763d')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd $pkgname
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd $pkgname
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd $pkgname
    cargo test --frozen --all-features
}

package() {
    cd $pkgname
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
