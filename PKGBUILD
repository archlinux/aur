# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=image-ascii-art-tauri-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Image ASCII convertissor made in React converted to desktop app using Tauri"
arch=('x86_64')
url="https://im-rises.github.io/image-ascii-art-website/"
_githuburl="https://github.com/Im-Rises/image-ascii-art-tauri"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'pango' 'glib2' 'libsoup' 'gdk-pixbuf2' 'gcc-libs' 'webkit2gtk' 'cairo' 'gtk3' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/app-v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/Im-Rises/image-ascii-art-tauri/app-v${pkgver}/LICENSE")
sha256sums=('489279d8b9207a97a95ab03ce57ecb84e52333b74fce05dbfb5b89128aa4e6b4'
            '92f519384eec3e47f087ae165e59b07bae73aded451eaf7da83bf688a9e76027')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|Categories=|Categories=Graphics;Utility|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}