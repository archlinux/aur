# Maintainer: Tech-with-anmol <anmollklfh@gmail.com>
pkgname=rwe
pkgver=0.2.0
pkgrel=1
pkgdesc="RWE (research with ease) - A desktop app for making deep dive research easier & fast"
arch=('x86_64')
url="https://github.com/Tech-with-anmol/RWE"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
makedepends=('rust' 'cargo' 'nodejs' 'bun-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tech-with-anmol/RWE/archive/refs/tags/app-v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/RWE-app-v${pkgver}"
    bun install
    bun tauri build
}

package() {
    cd "${srcdir}/RWE-app-v${pkgver}"
    install -Dm755 "src-tauri/target/release/rwe" "${pkgdir}/usr/bin/rwe"
    install -Dm644 "src-tauri/icons/icon.png" "${pkgdir}/usr/share/pixmaps/rwe.png"
}
