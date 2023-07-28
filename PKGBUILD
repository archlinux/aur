# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="wubi-dict-editor"
pkgver=1.21
pkgrel=2
pkgdesc="五笔码表助手 for Rime ( Windows、macOS、Ubuntu ) 基于 electron 开发."
arch=("x86_64")
url="https://github.com/KyleBing/wubi-dict-editor"
license=('GPL3')
depends=('ibus-rime' 'electron24')
makedepends=('npm' 'yarn' 'asar' 'nodejs')
conflicts=("${pkgname}")
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.png::https://user-images.githubusercontent.com/12215982/139462759-e6d8ebc6-180d-4d18-8c3c-68234f0ff1c0.png"
    "${pkgname}.sh")
sha256sums=('8948abfa58980007c8b352bd953672693f23b264e68d9350a7739db01506d7f5'
            'b70f00f133517296d81cb0f546a70539b46ebaf82baeab7adec13056bc42ec12'
            'ef6e64129224e6860e191fd8905d8fd111ad88b8a9d08b32b7c02629b6297461')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn install 
    yarn run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    asar pack "${srcdir}/${pkgname}-${pkgver}/out/五笔码表助手-linux-x64/resources/app" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f --icon "${pkgname}" --categories "Utility" --name "${pkgname}" --genericname="五笔码表助手 for Rime" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}