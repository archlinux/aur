# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=image-ascii-art-tauri-bin
pkgver=1.1.0
pkgrel=5
pkgdesc="Image ASCII convertissor made in React converted to desktop app using Tauri.(Prebuilt version)"
arch=('x86_64')
url="https://im-rises.github.io/image-ascii-art-website/"
_ghurl="https://github.com/Im-Rises/image-ascii-art-tauri"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk'
    'gtk3'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/app-v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Im-Rises/image-ascii-art-tauri/app-v${pkgver}/LICENSE"
)
sha256sums=('489279d8b9207a97a95ab03ce57ecb84e52333b74fce05dbfb5b89128aa4e6b4'
            '4676dff30e55d6b19e92e9bddb71c3cf479ca2c97db69f4080b2687a68e80835')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/Categories=/Categories=Graphics;/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 128x128)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}