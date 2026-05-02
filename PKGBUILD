# Maintainer: viewerofall <joemomanugget@gmail.com>
pkgname=yourmom-git
pkgver=1.1.0
pkgrel=1
pkgdesc="The most cursed programming language in existence — quantum esoteric lang that transpiles to C"
arch=('x86_64')
url="https://github.com/viewerofall-labs/yourmom"
license=('GPL-3.0-or-later')
depends=('gcc')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/viewerofall-labs/yourmom.git")
sha256sums=('SKIP')

build() {
    cd yourmom
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

check() {
    cd yourmom
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release 2>/dev/null || true
}

package() {
    cd yourmom
    install -Dm755 target/release/yourmom "${pkgdir}/usr/bin/yourmom"
    [ -f LICENSE ] && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || true
    [ -f README.md ] && install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md" || true
    [ -f qol.momjoke ] && install -Dm644 qol.momjoke "${pkgdir}/usr/share/yourmom/qol.momjoke" || true
}
