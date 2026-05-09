# Maintainer: AmarBego <begovicamar@proton.me>
pkgname=gittop
pkgver=0.5.2
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
sha256sums=('b1277e048313798cac49b273cbe51a301368f9e7d6ead9383486b3574f9d24d2')

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
