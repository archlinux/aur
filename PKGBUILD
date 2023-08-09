# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tencent-transmart-bin
_appname=TranSmart
pkgver=Alpha0.10.1
pkgrel=2
pkgdesc="腾讯交互翻译融合了腾讯人工智能实验室自研的交互式机器翻译、神经网络机器翻译、 统计机器翻译、语义理解、信息检索等技术，帮助用户更快、更好地完成翻译任务。"
arch=("x86_64")
url="https://transmart.qq.com/"
license=('custom')
depends=('qt5-base' 'nspr' 'libxcb' 'gcc-libs' 'gmp' 'fontconfig' 'libglvnd' 'freetype2' 'zlib' 'alsa-lib' 'libx11' \
    'sh' 'glibc' 'libgpg-error' 'fcitx-qt5' 'e2fsprogs' 'libp11-kit' 'openssl-1.1' 'nss' 'expat' 'libxkbcommon')
makedepends=('gendesk')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::https://cdn.transmart.qq.com/installation_pro/${_appname}_${pkgver}(20230713)_linux.tar.gz")
noextract=("${pkgname%-bin}-${pkgver}.tar.gz")
sha256sums=('acef0abb8fc0af1fa11514ceb5ea3f615c132e2c7770c58cfb9ca29f571ad3d7')
package() {
    install -Dm755 -d "${pkgdir}/opt"
    bsdtar -xf "${pkgname%-bin}-${pkgver}.tar.gz" -C "${pkgdir}/opt" --gname root --uname root
    mv "${pkgdir}/opt/transmart_${pkgver}_linux" "${pkgdir}/opt/${pkgname%-bin}"
    find "${pkgdir}/opt" -type f -exec chmod 644 {} \;
    mv "${pkgdir}/opt/${pkgname%-bin}/使用说明" "${pkgdir}/opt/${pkgname%-bin}/Readme"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/Readme" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    chmod 755 "${pkgdir}/opt/${pkgname%-bin}/runApp.sh" "${pkgdir}/opt/${pkgname%-bin}/${_appname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --exec "/opt/${pkgname%-bin}/runApp.sh" --categories "Utility" --name "腾讯交互翻译TranSmart"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
}