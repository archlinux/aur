# Maintainer Vincent Schweiger <vincent.schweiger@xolley.de>

pkgname=rget
pkgver=1.1.2
pkgrel=1
pkgdesc="Wget alternative"
arch=(x86_64)
license=('GPL')
makedepends=('rustup')
url=https://github.com/legendary-cookie/rustutils
source=("https://github.com/legendary-cookie/rustutils/archive/refs/tags/${pkgname}-${pkgver}.tar.gz")
sha256sums=('21ddec6788cc01af77b283fda7bd85fc98146547188eab74bc13ff51e2c494be')

prepare() {
    cd "$srcdir/rustutils-${pkgname}-${pkgver}"
    cargo update
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/rustutils-${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo build -p ${pkgname} --frozen --release --all-features
}


package() {
    cd "$srcdir/rustutils-${pkgname}-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}"
}


#vim: syntax=sh
