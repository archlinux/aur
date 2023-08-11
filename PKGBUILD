# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fclash-bin
_appname="cn.kingtous.${pkgname%-bin}"
pkgver=1.4.1
pkgrel=2
pkgdesc="A better open-source clash client written by Flutter.更好的Clash客户端,支持自动设置代理,兼容RULE-SET、TUN特性"
arch=('aarch64' 'x86_64')
url="https://kingtous.cn/2022/05/09/%E8%87%AA%E5%88%B6fclash%E7%AE%80%E4%BB%8B/"
_githuburl="https://github.com/fclash/fclash"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('gdk-pixbuf2' 'glib2' 'libepoxy' 'libdbusmenu-glib' 'pango' 'gtk3' 'cairo' 'libayatana-appindicator' 'glibc' 'gcc-libs' 'at-spi2-core' 'harfbuzz')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-aarch64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-x86_64.deb")
sha256sums_aarch64=('d29bc6c1a3188e9cec4b0c325c20b16311721536b04e890bb34a0855fc7e68f8')
sha256sums_x86_64=('c6bf17a28fd5301dadc0f07d8cfd51f0cd02cd9432f6318deff63668b69bf143')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/apps/${_appname}/files/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|/opt/apps/${_appname}/files/${pkgname%-bin}|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|/opt/apps/${_appname}/entries/icons/${_appname}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${_appname}/entries/icons/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}