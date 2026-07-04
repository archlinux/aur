# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=flerp
pkgver=0.5.1
_rev='35c31c791e4da13b32bca06266ce2b732fa0e35f'
pkgrel=1
pkgdesc='A terminal UI for exploring and analyzing text files, PDFs, and images'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
    'armv7'
)
url='https://github.com/Huseynteymurzade28/flerp'
license=(
    'MIT'
)
makedepends=(
    'cargo'
)
options=(
    # !lto
    !debug
)
provides=('flerp')
conflicts=('flerp-git')
source=(
    "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
)
sha256sums=('37fd40692522f95f390bd51813adac6db30b333eba2f6c10ef3f4797388a4868')

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 target/release/flerp "$pkgdir/usr/bin/flerp"
    # install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    # install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
