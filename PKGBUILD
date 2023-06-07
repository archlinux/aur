# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=addressbook-desktop-bin
pkgver=1.2.0
pkgrel=2
pkgdesc="Backbone React/Redux/MUIv5 Electron Application For macOS(x64/arm64) / Windows(x86_64)"
arch=('x86_64')
url="https://github.com/dredwardhyde/addressbook-desktop-app"
license=('Apache')
depends=('cairo' 'mesa' 'libxcomposite' 'dbus' 'libxdamage' 'libxkbcommon' 'glib2' 'libxrandr' 'libcups' 'glibc' 'gtk3' \
    'libdrm' 'expat' 'nspr' 'libxfixes' 'pango' 'libxext' 'nss' 'libxcb' 'alsa-lib' 'libx11' 'at-spi2-core' 'gcc-libs')
makedepends=('npm' 'gendesk')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname%-bin}.png")
sha256sums=('866eed289ef40d2f3585508c82453cf48d1e46229e3605c0c5c56cb3a806e560'
            '69a031a39efb4564ee88f08d36cb5b606d99429ad77f47f967f88a6a4d40937f')
build() {
    cd "${srcdir}/${pkgname%-bin}-app-${pkgver}"
    npm install --force
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-app-${pkgver}/out/Addressbook Desktop-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f --icon "${pkgname%-bin}" --categories "Utility" --name "Addressbook Desktop" --exec '"/opt/addressbook-desktop/Addressbook Desktop" %U'
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}