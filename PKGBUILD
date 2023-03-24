# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=weimail
pkgname="${_pkgname}-uos"
_uosname=cn.ankexinchuang.weimail
pkgver=2.3.5.9
pkgrel=2
pkgdesc="Native Xinchuang email client, free email client software that supports multiple Xinchuang platforms.Just used in China."
arch=("x86_64")
url="https://ankexinchaung.cn"
_appstore="https://com-store-packages.uniontech.com/pool/appstore"
license=('unknown')
depends=(dbus dbus-glib at-spi2-core nss gtk2 java-runtime gtk3 libxt hicolor-icon-theme libxrender libx11 \
    libxext gcc-libs glibc glib2 libxcb gdk-pixbuf2 cairo pango nspr fontconfig freetype2)
optdepends=()
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.deb::${_appstore}/c/${_uosname}/${_uosname}_${pkgver}_amd64.deb")
sha256sums=('6607e19422fb0180fd4bf925b4632ba92773470ed1969a5f6cf0687b2cbdd31d')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/apps/${_uosname}" "${pkgdir}/opt/apps/${_pkgname}"
    rm -r "${pkgdir}/opt/apps/${_pkgname}/info"
    sed 's/Categories=Email/Categories=Network;Office/g;s/cn.ankexinchuang.weimail/weimail/g;s/\/opt\/apps\/weimail\/files\/weimail.png/weimail/g' \
        -i "${pkgdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${_pkgname}/entries/icons/hicolor/scalable/apps/${_uosname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
}