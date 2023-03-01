# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=weimail-uos
_uosname=cn.ankexinchuang.weimail
_pkgname=weimail
pkgver=2.3.5.9
pkgrel=1
pkgdesc="Native Xinchuang email client, free email client software that supports multiple Xinchuang platforms.Just used in China."
arch=("x86_64")
url="https://ankexinchaung.cn"
license=('unknown')
depends=(dbus-glib at-spi2-core nss gtk2 java-runtime gtk3 libxt)
optdepends=()
conflicts=()
source=("${_pkgname}_${pkgver}.deb::https://com-store-packages.uniontech.com/pool/appstore/c/${_uosname}/${_uosname}_${pkgver}_amd64.deb")
sha256sums=('6607e19422fb0180fd4bf925b4632ba92773470ed1969a5f6cf0687b2cbdd31d')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/apps/${_uosname}" "${pkgdir}/opt/apps/${pkgname}"
    rm -r "${pkgdir}/opt/apps/${pkgname}/info"
    sed 's/cn.ankexinchuang.weimail/weimail-uos/g;s/Categories=Email;/Categories=Network;Office;/g;s/Icon/#Icon/g' \
        -i "${pkgdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
    echo "Icon=${_pkgname}" >> "${pkgdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_uosname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
}
