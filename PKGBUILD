# Maintainer: Leo Liu <leoliu0@users.noreply.github.com>
pkgname=ratex
pkgver=0.1.0
pkgrel=2
pkgdesc="Ultra-fast, pure-Rust TeX engine and typesetting toolchain (built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/leoliu0/ratex"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
provides=('texmk')
conflicts=('ratex-bin')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leoliu0/ratex/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c177de1eaa509e807a78e19c3cf6187ac8ed3d38b68e37ee2348d88515777945')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked --bin texmk
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 target/release/texmk "$pkgdir/usr/bin/texmk"
    if [ -f LICENSE-MIT ]; then
        install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    fi
    if [ -f LICENSE-APACHE ]; then
        install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    fi
}
