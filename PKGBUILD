# Maintainer: Phillip MacNaughton <wisheralpha@gmail.com>
pkgname='er-save-manager-bin'
_pkgname=er-save-manager
pkgver='1.10.3'
pkgrel=1
pkgdesc='Elden Ring save editor, backup manager and corruption fixer'
arch=('x86_64')
url='https://github.com/Hapfel1/er-save-manager'
license=('LicenseRef-Source-Available')

# Start empty. Add only dependencies demonstrated to be required.
depends=(
    'fuse2'
    'libxcb'
    'fontconfig'
    'hicolor-icon-theme'
)

provides=('er-save-manager')
conflicts=('er-save-manager')

# AppImages contain an ELF runtime followed by a SquashFS filesystem.
# Stripping the ELF runtime corrupts the AppImage.
options=(
    '!strip'
    '!debug'
)

source=(
    "${_pkgname}_${pkgver}_Linux.AppImage::https://github.com/Hapfel1/er-save-manager/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux.AppImage"
    "${_pkgname}.png::https://raw.githubusercontent.com/Hapfel1/er-save-manager/v${pkgver}/resources/icon/icon.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Hapfel1/er-save-manager/v${pkgver}/LICENSE"
    "${_pkgname}.desktop"
)

sha256sums=('c42ba7b990bccb953190bdc0480d06a4a3ed4aa7b7516faa0bfeef4d485f0315'
            '0d423ea2d046fc107e4af4d2938ccebf530bf99d7ac87032d8ce93d6e7d15ce8'
            'a8d6f40c43e0f55ac8fc2fde7cc06ff399a4b9f59e08d541965f6a4fe7d924d8'
            '8f9944e098e6b8a5e5734ab42038268566ca69122ded7c7b74fceb089f8f6ebb')

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
