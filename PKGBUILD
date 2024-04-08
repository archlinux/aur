# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fclash-bin
_appname="cn.kingtous.${pkgname%-bin}"
pkgver=1.4.5
pkgrel=1
pkgdesc="A better open-source clash client written by Flutter.更好的Clash客户端,支持自动设置代理,兼容RULE-SET、TUN特性"
arch=(
    'aarch64'
    'x86_64'
)
url="https://kingtous.cn/2022/05/09/%E8%87%AA%E5%88%B6fclash%E7%AE%80%E4%BB%8B/"
_ghurl="https://github.com/fclash/fclash"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'libayatana-appindicator'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-aarch64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}-meta-${pkgver}-x86_64.deb")
sha256sums_aarch64=('55895d61b7ed1998f393854aec103e40758371792160306414533a34143dadf5')
sha256sums_x86_64=('1fe1f31ba68391838b542fd5fff80714ea5a4646db549ccbdf810118591ba037')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|/opt/apps/${_appname}/files/${pkgname%-bin}|${pkgname%-bin}|g" \
        -e "s|/opt/apps/${_appname}/entries/icons/${_appname}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/apps/${_appname}/files/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${_appname}/entries/icons/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}