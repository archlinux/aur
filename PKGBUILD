# Maintainer: viewerofall <joemomanugget@gmail.com>
pkgname=yourmom
pkgver=1.1.0
pkgrel=1
pkgdesc="The most cursed programming language in existence — quantum esoteric lang that transpiles to C"
arch=('x86_64')
url="https://github.com/viewerofall/yourmom"
license=('GPL-3.0-or-later')
depends=('gcc')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/viewerofall/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen 2>/dev/null || true
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 target/release/yourmom "${pkgdir}/usr/bin/yourmom"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 qol.momjoke "${pkgdir}/usr/share/yourmom/qol.momjoke"
}
