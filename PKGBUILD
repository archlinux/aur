# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quadrant-bin
_pkgname=Quadrant
pkgver=26.4.0
pkgrel=1
pkgdesc="An easy way to manage your Minecraft modpacks, written in React and Rust.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://usequadrant.dev/"
_ghurl="https://github.com/QuadrantMC/quadrant"
license=('MPL-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'libappindicator'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}-stable/${_pkgname}-${pkgver}-stable-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}-stable/${_pkgname}-${pkgver}-stable-1.x86_64.rpm")
sha256sums_aarch64=('841467e091b200561c2e8d6bedc7857f8dcb3989a439e8f438e30182e48aa0d5')
sha256sums_x86_64=('2077b2c31d74b89a700fbf4843b5533ce7716729e1a31b7831e22e09a690440d')
prepare() {
    sed -i "s/${pkgname%-bin}_next/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}_next" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib" "${pkgdir}/usr"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}_next.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
