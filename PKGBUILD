# Maintainer: Simon Repp <simon@fdpl.io>

arch=('aarch64' 'x86_64')
conflicts=('zeroform-bin')
license=('AGPL3')
makedepends=('cargo' 'git')
options=('!lto')
pkgdesc='A static and dynamic online form generator'
pkgname=zeroform
pkgrel=1
pkgver=0.8.0
sha256sums=('89a5f9ed96738adaed1634eb80d12b4c19941b71e840a46ee0423419a4bda193')
url='https://simonrepp.com/zeroform'

source=("zeroform-${pkgver}.tar.gz::https://codeberg.org/simonrepp/zeroform/archive/${pkgver}.tar.gz")

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/zeroform"
    cargo build --locked --offline --release
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/zeroform/target/release/zeroform" "$pkgdir/usr/bin/zeroform"
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/zeroform"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
