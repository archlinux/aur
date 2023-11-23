# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=weimail-bin
_uosname="cn.ankexinchuang.${pkgname%-bin}"
pkgver=2.3.5.9
pkgrel=2
pkgdesc="Native Xinchuang email client, free email client software that supports multiple Xinchuang platforms.Just used in China."
arch=("x86_64")
url="https://ankexinchaung.cn"
_appstore="https://com-store-packages.uniontech.com/pool/appstore"
license=('custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'java-runtime'
    'freetype2'
    'gtk3'
    'gdk-pixbuf2'
    'at-spi2-core'
    'cairo'
    'libxrender'
    'fontconfig'
    'dbus-glib'
    'libxcb'
    'nspr'
    'gtk2'
    'nss'
    'pango'
    'libxt'
    'libx11'
    'libxext'
    'hicolor-icon-theme'
)
source=("${pkgname%-bin}-${pkgver}.deb::${_appstore}/c/${_uosname}/${_uosname}_${pkgver}_amd64.deb")
sha256sums=('6607e19422fb0180fd4bf925b4632ba92773470ed1969a5f6cf0687b2cbdd31d')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|/opt/apps/${_uosname}/files/${pkgname%-bin}|${pkgname%-bin}|g" \
        -e "s|.png||g" \
        -e "s|Categories=Email;|Categories=Network;|g" \
        -i "${srcdir}/opt/apps/${_uosname}/entries/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/apps/${_uosname}/files/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_uosname}/entries/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/apps/${_uosname}/entries/icons/hicolor/scalable/apps/${_uosname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
}