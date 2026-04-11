# Maintainer: arbaes <https://github.com/arbaes>

pkgname=rtte-git
pkgver=r38.fae07ec
pkgrel=1
pkgdesc="Rust reimplementation of TerminalTextEffects (TTE)"
arch=('x86_64')
url="https://github.com/arbaes/rtte"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'rust' 'cargo')
provides=('rtte')
conflicts=('rtte')
source=("${pkgname}::git+https://github.com/arbaes/rtte.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    cargo build --release --locked 2>/dev/null || cargo build --release
}

check() {
    cd "${pkgname}"
    cargo test --release
}

package() {
    cd "${pkgname}"
    install -Dm755 target/release/rtte "${pkgdir}/usr/bin/rtte"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
