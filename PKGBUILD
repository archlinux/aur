# Maintainer: AkitaOnRails <fabio.akita@gmail.com>
pkgname=omarchy-games-menu
pkgver=0.1.0
pkgrel=1
pkgdesc="Steam-like QuickShell launcher grid for distrobox-managed PC ports, recomps and emulators (Rust backend)"
arch=('x86_64')
url="https://github.com/akitaonrails/omarchy-games-menu"
license=('MIT')
depends=('quickshell')
makedepends=('cargo')
# makepkg's global LTO breaks ring's C objects when linked by rust-lld.
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0d02c64ab80aeed79635adf40db6429d243326ac4282632e98212ea377272a14')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/ogm" "${pkgdir}/usr/bin/ogm"
    install -Dm755 "games-menu" "${pkgdir}/usr/bin/games-menu"
    install -dm755 "${pkgdir}/usr/share/omarchy-games-menu"
    cp -r qml "${pkgdir}/usr/share/omarchy-games-menu/qml"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
