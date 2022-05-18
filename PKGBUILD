# Maintainer: NAHFE

pkgname=schedule24
pkgver=0.1.0.r0.g2295862
pkgrel=1
pkgdesc="Skola24 schedule tui"
arch=("any")
makedepends=("cargo")
url="https://github.com/NAHFE/schedule24"
source=("schedule24::git+https://github.com/NAHFE/schedule24.git")
sha256sums=("SKIP")

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${srcdir}/${pkgname}
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd ${srcdir}/${pkgname}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd ${srcdir}/${pkgname}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
