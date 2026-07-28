# Maintainer: Phillip MacNaughton <wisheralpha@gmail.com>
pkgname='er-save-manager-bin'
_pkgname=er-save-manager
pkgver='1.7.1'
pkgrel=1
pkgdesc='Elden Ring save editor, backup manager and corruption fixer'
arch=('x86_64')
url='https://github.com/Hapfel1/er-save-manager'
license=('LicenseRef-Source-Available')

# Start empty. Add only dependencies demonstrated to be required.
depends=(
    'fuse2'
    'hicolor-icon-theme'
)

provides=('er-save-manager')
conflicts=('er-save-manager')

# AppImages contain an ELF runtime followed by a SquashFS filesystem.
# Stripping the ELF runtime corrupts the AppImage.
options=('!strip')

source=(
    "${_pkgname}_${pkgver}_Linux.AppImage::https://github.com/Hapfel1/er-save-manager/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux.AppImage"
    "${_pkgname}.png::https://raw.githubusercontent.com/Hapfel1/er-save-manager/v${pkgver}/resources/icon/icon.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Hapfel1/er-save-manager/v${pkgver}/LICENSE"
    "${_pkgname}.desktop"
)

sha256sums=('cf72468bf3d35aada269bc883df318436e286ce3a7de966559ba7e80eca9d53d'
            '0d423ea2d046fc107e4af4d2938ccebf530bf99d7ac87032d8ce93d6e7d15ce8'
            'd50b6f5b22971b3e53912a1b4f09a77cf99c20853f451126721caf830c715e13'
            '351edfde8daa69af9144819cc341ba1ba2cc2aabc71c7806af52e8a49a6736bf')

package() {
    install -Dm755 \
        "${_pkgname}_${pkgver}_Linux.AppImage" \
        "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}.AppImage"

    install -Dm644 \
        "${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    install -Dm644 \
        "${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    install -Dm644 \
        "LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -d "${pkgdir}/usr/bin"

    ln -s \
        "/usr/lib/${_pkgname}/${_pkgname}.AppImage" \
        "${pkgdir}/usr/bin/${_pkgname}"
}
