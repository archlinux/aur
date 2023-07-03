# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="wubi-dict-editor"
pkgver=1.20
pkgrel=1
pkgdesc="五笔码表助手 for Rime ( Windows、macOS、Ubuntu ) 基于 electron 开发."
arch=("x86_64")
url="https://github.com/KyleBing/wubi-dict-editor"
license=('GPL3')
depends=('cairo' 'gcc-libs' 'mesa' 'nss' 'libxrandr' 'libcups' 'gtk3' 'nodejs' 'libxshmfence' 'libxfixes' 'expat' \
    'pango' 'alsa-lib' 'libxcomposite' 'at-spi2-core' 'dbus' 'nspr' 'libx11' 'libxext' 'libxcb' 'glibc' 'libdrm' \
    'glib2' 'gdk-pixbuf2' 'libxdamage' 'libxkbcommon')
makedepends=('npm' 'yarn')
conflicts=("${pkgname}")
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.png::https://user-images.githubusercontent.com/12215982/139462759-e6d8ebc6-180d-4d18-8c3c-68234f0ff1c0.png")
sha256sums=('1fa89014638b554f8796cae6794e38440c7a76a8cd4694bf579bf6886130fd73'
            'b70f00f133517296d81cb0f546a70539b46ebaf82baeab7adec13056bc42ec12')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn install && yarn run package
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/五笔码表助手-linux-x64/"* "${pkgdir}/opt/${pkgname}"
    mv "${pkgdir}/opt/${pkgname}/五笔码表助手" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f --icon "${pkgname}" --categories "Utility" --name "${pkgname}" --genericname="五笔码表助手 for Rime" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}