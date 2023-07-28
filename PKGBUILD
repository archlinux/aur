# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=weimail
pkgname="${_pkgname}-uos"
_uosname="cn.ankexinchuang.${_pkgname}"
pkgver=2.3.5.9
pkgrel=3
pkgdesc="Native Xinchuang email client, free email client software that supports multiple Xinchuang platforms.Just used in China."
arch=("x86_64")
url="https://ankexinchaung.cn"
_appstore="https://com-store-packages.uniontech.com/pool/appstore"
license=('unknown')
depends=('dbus' 'java-runtime' 'freetype2' 'gtk3' 'gdk-pixbuf2' 'at-spi2-core' 'cairo' 'libxrender' 'gcc-libs' 'glibc' \
    'fontconfig' 'dbus-glib' 'libxcb' 'nspr' 'gtk2' 'nss' 'pango' 'libxt' 'libx11' 'glib2' 'libxext' 'hicolor-icon-theme')
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.deb::${_appstore}/c/${_uosname}/${_uosname}_${pkgver}_amd64.deb")
sha256sums=('6607e19422fb0180fd4bf925b4632ba92773470ed1969a5f6cf0687b2cbdd31d')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    mv "${pkgdir}/opt/apps/${_uosname}" "${pkgdir}/opt/apps/${_pkgname}"
    rm -r "${pkgdir}/opt/apps/${_pkgname}/info"
    sed "s|${_uosname}|${_pkgname}|g;s|/opt/apps/${_pkgname}/files/${_pkgname}.png|${_pkgname}|g" \
        -i "${pkgdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${_pkgname}/entries/icons/hicolor/scalable/apps/${_uosname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
}