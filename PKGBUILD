# Maintainer: Jian Wei Cheong <aur at jianwei dot anonaddy dot com>

pkgname=bibiman
pkgver=0.15.0
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
b2sums=('e2c4aa1eead5a0adc8e8c8be1fba095e26b53fce79b3d36ceecb0f0e1450129d52b18320d97e5679dd1745ed980744f35ebe307c44ddb204c73843b2d4e5ea2a')

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
