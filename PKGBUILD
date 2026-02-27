# Maintainer: fr0stb1rd - fr0stb1rd.gitlab.io
pkgname=pdf-metadata-editor-bin
_pkgname=pdf-metadata-editor
pkgver=4.0.1
pkgrel=1
pkgdesc="A simple, cross-platform desktop application for viewing and editing PDF metadata"
arch=('x86_64' 'aarch64')
url="https://github.com/zaro/pdf-metadata-editor"
license=('MIT')
depends=('alsa-lib' 'gtk3' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'xdg-utils' 'hicolor-icon-theme')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-1_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-1_arm64.deb")

sha512sums_x86_64=('647f9b9e632de6733b705c684347d3677c03921f7dbe57b9b4ef3270e4608cb8bc08b87082ee18c3c2891996f73eb7c25b548788776c10fb0f99524d06b62275')
sha512sums_aarch64=('5cf7f6ef568e4454e2a27ce1c86e4e20799717b15553dc1b928ea18aaf8b0e83d75f6fd05a57ed201359251090d640fbd9b6cda36540c88bcf83d6d534acbdc7')

package() {
    # Extract data.tar.zst from .deb
    bsdtar -xf data.tar.zst -C "${pkgdir}"

    # Create symlink
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/bin/Pdf Metadata Editor" "${pkgdir}/usr/bin/${_pkgname}"
    
    # Install .desktop file
    install -d "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/lib/${_pkgname}-Pdf_Metadata_Editor.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Install icon
    install -d "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/lib/Pdf_Metadata_Editor.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    
    # Fix .desktop file Exec and Icon
    sed -i "s|Exec=.*|Exec=/usr/bin/${_pkgname}|" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i "s|Icon=.*|Icon=${_pkgname}|" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
