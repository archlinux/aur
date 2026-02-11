# Maintainer: fr0stb1rd - fr0stb1rd.gitlab.io
pkgname=pdf-metadata-editor-bin
_pkgname=pdf-metadata-editor
pkgver=4.0.0
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

sha512sums_x86_64=('2f5ea2d81cb4703b13d0a7c802a397ec795d4e54cd7133d3d74cba88bb52ead1ebe82be7561a4b291d5f42feeef9d134f0645d1541241cddfd0a76b817893890')
sha512sums_aarch64=('8abb89db3495e3310dd31a654864ba1da45660c89e5710d2c577a6110329b533be2b0acf54d1aa09550e20ede0a5b9f513ed9ac5cc1e42e65faf8254227543a5')

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
