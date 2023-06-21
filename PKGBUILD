# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="fclash-bin"
_appname="cn.kingtous.${pkgname%-bin}"
pkgver=1.3.11
pkgrel=1
pkgdesc="A better open-source clash client written by Flutter.更好的Clash客户端,支持自动设置代理,兼容RULE-SET、TUN特性"
arch=('x86_64')
url="https://kingtous.cn/2022/05/09/%E8%87%AA%E5%88%B6fclash%E7%AE%80%E4%BB%8B/"
_githuburl="https://github.com/fclash/fclash"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-bin}")
depends=('gdk-pixbuf2' 'glib2' 'libepoxy' 'libdbusmenu-glib' 'pango' 'gtk3' 'cairo' 'libayatana-appindicator' 'glibc' \
    'gcc-libs' 'at-spi2-core')
source=("${pkgname%-bin}-${pkgver}.pkg.tar.zst::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('f69594e9e81332b1d243d18f95f1904c97d5f234b1449ec89689e74e5da147c0')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    rm -rf "${pkgdir}/opt/apps/${_appname}/info"
    sed "s|/opt/apps/${_appname}/entries/icons/${_appname}.png|${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${_appname}.desktop"
    mv "${pkgdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/entries/icons/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}