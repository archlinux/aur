# Maintainer: Guru <anjanaya@gmail.com>
pkgname=open-pencil-bin
pkgver=0.15.1
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
sha256sums=('20fead42815b6d2a7854b688913becbba5e1ce2a7efb2c6e0a0e2340014571f8'
            '38ac54d3b48ccb6b3c0044b37bec1d75c21c3dc38b34a5a8c52a3cea34ba514b')
options=('!strip')

package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

    # Fix empty Categories in .desktop file
    sed -i 's/^Categories=$/Categories=Graphics;/' "${pkgdir}/usr/share/applications/OpenPencil.desktop"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
