# Maintainer: Hossam Mostafa <hossamdash2@gmail.com>
# Contributor: Nathanael Demacon <nathanael.dmc[at]outlook[dot]fr>
pkgname=sshs
pkgver=4.5.1
pkgrel=1
pkgdesc="Terminal user interface for SSH"
arch=('x86_64')
url="https://github.com/quantumsheep/sshs"
license=('MIT')

depends=('openssh')
makedepends=('cargo')

source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c5383138114262fd49ac91c77830f9c6a09f02c5650e5e5cfa8ede1fa3383d96')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
