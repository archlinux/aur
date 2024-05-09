# Maintainer: Giovanni Torelli <giovanni.walter@outlook.com>

pkgname=hyprmixer
pkgver=1.0.1
pkgrel=1
pkgdesc="A stylish volume mixer and media controller for your hyprland rice"
arch=('x86_64')
url="https://github.com/Torelli/hyprmixer"
license=('MIT')
depends=('playerctl')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/Torelli/hyprmixer/releases/download/${pkgver}/hyprmixer.AppImage"
               "https://raw.githubusercontent.com/Torelli/hyprmixer/${pkgver}/LICENSE"
              )
noextract=("${pkgname}-${pkgver}.AppImage")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

    # Symlink license
    mkdir -p "${pkgdir}/usr/share/licenses/$pkgname"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
sha256sums_x86_64=('b0e07d2c06ebea5095ee2c1fee722ac58f6b121c96001544ba24aec8705b11c8'
                   '29eee3e9d9c5dd67213ec3ab4a7eef57a1224750e2e9aab3a278177a9444a355')
