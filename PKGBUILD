# Maintainer: Pando85 <pando855@gmail.com>

_pkgname=promrail
pkgname="${_pkgname}"
pkgver=0.1.1
pkgrel=1
pkgdesc="Git-native GitOps promotion tool"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/forkline/prl"
license=('MIT')
makedepends=('cargo'
             'pkgconf'
             'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+$url.git#tag=v${pkgver}")
sha512sums=('SKIP')

prepare() {
    cd "$srcdir/prl"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/prl"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/prl"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/prl"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/prl"
}
