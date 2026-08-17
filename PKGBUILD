# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
# Maintainer: flear <teymurzadehuseyn14@gmail.com>
pkgname=flerp
pkgver=0.7.0
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
sha256sums=('6500378f0af29681827c15c8a52c719f954a84e779c873611cd1f831a142bac1')

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
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.MD -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim: ts=4 sw=4 et:
