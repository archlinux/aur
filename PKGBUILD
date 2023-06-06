# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="udeler-pro-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop application to download Udemy courses with attachments."
arch=("x86_64")
url="https://github.com/rsathishtechit/udeler-pro"
license=('custom')
depends=('dbus' 'mesa' 'at-spi2-core' 'nss' 'libxcomposite' 'nspr' 'cairo' 'libxcb' 'libxfixes' 'gcc-libs' 'libxkbcommon' \
    'alsa-lib' 'libxdamage' 'pango' 'libx11' 'expat' 'glibc' 'libxrandr' 'libdrm' 'libxext' 'gtk3' 'glib2' 'libcups')
makedepends=('yarn' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/FaisalUmair/udemy-downloader-gui/master/assets/images/build/icon.png")
sha256sums=('a1d36d37a4e965bba139236025ce2b06371305ccbd16e78b78ae8a18e4076f6a'
            '07b6ffff432cb6c9fe7b9a0d6919982b0a384195242e5bb852f2981281807bf7')
build() {
    cd "${srcdir}/${pkgname%-bin}-${pkgver}"
    yarn install
    yarn package
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}/out/${pkgname%-pro-bin}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/"LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${pkgname%-pro-bin} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}