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
provides=('ratex')
conflicts=('ratex-bin')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leoliu0/ratex/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('90d18fe0cd62a3d908684de44438229e6ad41de15f2d58871adcd27e3b69df4b')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked --bin ratex
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 target/release/ratex "$pkgdir/usr/bin/ratex"
    if [ -f LICENSE-MIT ]; then
        install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    fi
    if [ -f LICENSE-APACHE ]; then
        install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    fi
}
