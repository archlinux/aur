# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="altus"
pkgver=4.8.6
pkgrel=1
pkgdesc="Desktop client for WhatsApp Web with themes, notifications and multiple account support"
arch=('any')
url="https://github.com/amanharwara/altus"
license=('GPL3')
conflicts=("${pkgname}" "${pkgname}-appimage")
depends=('pango' 'glib2' 'libxext' 'alsa-lib' 'libxcomposite' 'libxcb' 'libdrm' 'libcups' 'at-spi2-core' 'libxrandr' 'dbus' 'libxkbcommon' \
    'libx11' 'gcc-libs' 'cairo' 'nspr' 'gtk3' 'nss' 'expat' 'mesa' 'libxfixes' 'libxdamage' 'glibc')
makedepends=('yarn' 'electron' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ca5cb6f78df1a04beb1113d152171db8d2bab7d41d65658ff511af4de9dc0171')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn install && yarn build
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f --icon "${pkgname}" --categories "Network" --name "Altus" --exec "/opt/${pkgname%}/${pkgname} %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}