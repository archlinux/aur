# Maintainer: Daniele Basso <dbas dot so at poul dot org>

pkgname=rubyfmt
pkgver=0.13.0
pkgrel=2
pkgdesc='rubyfmt to format ruby files'
url='https://github.com/fables-tales/rubyfmt'
license=()
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('18964b26fda04549ee1a7b9b6a413775661f7d39595d90bf603f4c373cf373ca')

options=(!lto)

prepare() {
    cd "rubyfmt-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "rubyfmt-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "rubyfmt-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "rubyfmt-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname-main"
    mv "$pkgdir/usr/bin/rubyfmt-main" "$pkgdir/usr/bin/rubyfmt"
    # for custom license, e.g. MIT
    # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
