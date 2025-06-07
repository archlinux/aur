# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=donutbrowser-bin
_pkgname='Donut Browser'
pkgver=0.3.2
pkgrel=1
pkgdesc="A powerful browser orchestrator that puts you in control of your browsing experience. 🍩(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://donutbrowser.com/"
_ghurl="https://github.com/zhom/donutbrowser"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /.}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /.}-${pkgver}-1.x86_64.rpm")
sha256sums_aarch64=('5ef97b579feee83829ecb22b58f47b5581d107d38075d951c2d12ab471c6d29f')
sha256sums_x86_64=('389ff87652edd0fd1e0fbadc01269983cab1358d7d1d41d272dbeb726d9199f3')
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}