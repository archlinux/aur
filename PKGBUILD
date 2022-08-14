# Maintainer: Arthurdw <contact@arthurdw.com>
_name=ffly
_loc="firefly/server"
pkgname=${_name}
pkgver=0.0.2
pkgrel=1
pkgdesc="An \"blazingly\" fast key-value pair database without bloat written in rust"
arch=(x86_64 i686)
url="https://github.com/Arthurdw/firefly"
license=('MIT')
makedepends=('cargo')
source=("git+https://github.com/Arthurdw/firefly.git")
sha256sums=('SKIP')

prepare() {
    cd $_loc
    
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $_loc

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}


package() {
    cd $_loc
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

check() {
    cd $_loc

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}


