# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=transmart
pkgname="tencent-${_pkgname}-bin"
_appname=TranSmart
pkgver=Alpha0.10.1
pkgrel=4
pkgdesc="腾讯交互翻译融合了腾讯人工智能实验室自研的交互式机器翻译、神经网络机器翻译、 统计机器翻译、语义理解、信息检索等技术，帮助用户更快、更好地完成翻译任务。"
arch=("x86_64")
url="https://transmart.qq.com/"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
    'nspr'
    'libxcb'
    'gmp'
    'fontconfig'
    'libglvnd'
    'freetype2'
    'zlib'
    'alsa-lib'
    'libx11'
    'sh'
    'libgpg-error'
    'e2fsprogs'
    'libp11-kit'
    'openssl-1.1'
    'nss'
    'expat'
    'libxkbcommon'
)
makedepends=(
    'gendesk'
)
optdepends=(
    ''fcitx-qt5''
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::https://cdn.transmart.qq.com/installation_pro/${_appname}_${pkgver}(20230713)_linux.tar.gz"
    "${pkgname%-bin}.sh"
)
sha256sums=('acef0abb8fc0af1fa11514ceb5ea3f615c132e2c7770c58cfb9ca29f571ad3d7'
            '8bbd612968b3aeaa0674e361d0e54ef1fda18de876eae781bdf195be4238544b')
build() {
    gendesk -q -f -n --pkgname "tencent-${_pkgname}-bin" --name "腾讯交互翻译TranSmart" --categories "Utility" --exec "${pkgname%-bin}"
    mv "${srcdir}/${_pkgname}_${pkgver}_linux/使用说明" "${srcdir}/${_pkgname}_${pkgver}_linux/README"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}_${pkgver}_linux/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}_${pkgver}_linux/README" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}_${pkgver}_linux/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}