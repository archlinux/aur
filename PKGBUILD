# Maintainer: Guru <anjanaya@gmail.com>
pkgname=open-pencil-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="AI-native design editor. Open-source Figma alternative built with Tauri."
arch=('x86_64')
url="https://github.com/open-pencil/open-pencil"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
provides=('open-pencil')
conflicts=('open-pencil')
source=("${pkgname}-${pkgver}.deb::https://github.com/open-pencil/open-pencil/releases/download/v${pkgver}/OpenPencil_${pkgver}_amd64.deb"
        "LICENSE::https://raw.githubusercontent.com/open-pencil/open-pencil/v${pkgver}/LICENSE")
sha256sums=('88dff32655ec3c03f951eb70f7c4a56aaee153c9d06f8b3a227cad461baf3b3c'
            '144ecf9417a43cca1cc2096acbac8b00beff9210191504709d586bf7552dcfa2')
options=('!strip')

package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

    # Fix empty Categories in .desktop file
    sed -i 's/^Categories=$/Categories=Graphics;/' "${pkgdir}/usr/share/applications/OpenPencil.desktop"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
