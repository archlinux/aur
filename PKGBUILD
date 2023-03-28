# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=loop
pkgname="microsoft-${_pkgname}-pake"
_appname="com-tw93-${_pkgname}"
pkgver=1.0.8
pkgrel=1
pkgdesc="Use Pake to package Microsoft Loop.Microsoft Loop is about people—people who want to create together with ease, no matter where they are or what tools they use. "
arch=('x86_64')
url="https://www.microsoft.com/en-us/microsoft-loop"
_githuburl="https://github.com/tw93/Pake"
license=(custom:freeware)
conflicts=("${_pkgname}")
depends=(hicolor-icon-theme gcc-libs glib2 pango gtk3 gdk-pixbuf2 glibc cairo webkit2gtk)
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/V${pkgver}/Loop_x86_64.deb"
    "LICENSE::https://go.microsoft.com/fwlink/?LinkID=206977")
sha256sums=('937f26465684e63174b2728c5497d8dd986967f86e0828993e101c1c30c31261'
            'a3ef20457b849b6c4b0f6eae58345ba9613055921232c1896eeed9c2187f2dd0')
package() {
    bsdtar -xvf data.tar.gz -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/apps/${_pkgname}"
    mv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/opt/apps/${_pkgname}/${_pkgname}"
    rm -rf "${pkgdir}/usr/share/applications" "${pkgdir}/usr/bin"
    gendesk -f --pkgname "${_pkgname}" --pkgdesc "Microsoft Loop is about people—people who want to create together with ease, no matter where they are or what tools they use. " \
        --icon "${_pkgname}" --categories "Utility;" --name "${_pkgname}" --exec "/opt/apps/${_pkgname}/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    mv "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}