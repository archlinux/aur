# Maintainer: AmarBego <begovicamar@proton.me>
pkgname=gittop
pkgver=0.5.3
pkgrel=1
pkgdesc="A lightweight GitHub notifications client. Why spin up a browser just to check your GitHub notifications?"
arch=('x86_64' 'aarch64')
url="https://github.com/AmarBego/GitTop"
license=('AGPL-3.0-only')
provides=('gittop')
conflicts=('gittop-bin')
depends=('gcc-libs')
makedepends=('cargo' 'pkgconf' 'glib2' 'gtk3' 'fontconfig' 'libxkbcommon' 'libx11')
options=('!strip' '!debug')
install=gittop.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AmarBego/GitTop/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bd59941db80cee6bab09588c17d4e0d18461105e690f56a0b26ac0c22a81f94a')

build() {
    cd "${srcdir}/GitTop-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/GitTop-${pkgver}"
    install -Dm755 "target/release/gittop" "${pkgdir}/usr/bin/gittop"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
    install -Dm644 "src/platform/resources/gittop.desktop" "${pkgdir}/usr/share/applications/gittop.desktop"
    install -Dm644 "assets/images/GitTop-256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gittop.png"
    install -Dm644 "assets/images/GitTop-256x256.png" "${pkgdir}/usr/share/pixmaps/gittop.png"
}
