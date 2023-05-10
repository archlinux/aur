# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=alpaca-electron-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="The simplest way to run Alpaca (and other LLaMA-based local LLMs) on your own computer"
arch=(x86_64)
url="https://github.com/ItsPi3141/alpaca-electron"
license=('MIT')
depends=('alsa-lib' 'sh' 'gcc-libs' 'gdk-pixbuf2' 'lib32-gcc-libs' 'nss' 'libxshmfence' 'libxext' 'libxfixes' 'dbus' \
    'cairo' 'libcups' 'gtk3' 'pango' 'lib32-glibc' 'libdrm' 'nodejs' 'hicolor-icon-theme' 'glibc' 'libxrandr' 'python' \
    'expat' 'libxdamage' 'libxcb' 'libx11' 'nspr' 'libxkbcommon' 'mesa' 'at-spi2-core' 'glib2' 'libxcomposite' )
makedepends=('gendesk')
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.bin::${url}/releases/download/v${pkgver}/Alpaca-Electron-linux-x64-v${pkgver}.tar.gz")
sha256sums=('f77cbb049b831a89be19ddc4b7334d3d5ad7779649d4f8410ba00c70a740f912')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/release-builds/Alpaca Electron-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 24x24 32x32 48x48 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/resources/app/icon/png/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f --icon "${pkgname%-bin}" --categories "Utility" --name "Alpaca Electron" --exec '"/opt/alpaca-electron/Alpaca Electron"'
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}