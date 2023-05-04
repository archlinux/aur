# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=loop
pkgname="microsoft-loop-pake"
_appname="com-tw93-${_pkgname}"
pkgver=2.0.0
pkgrel=1
pkgdesc="Use Pake to package Microsoft Loop.Microsoft Loop is about people—people who want to create together with ease, no matter where they are or what tools they use. "
arch=('x86_64')
url="https://www.microsoft.com/en-us/microsoft-loop"
_githuburl="https://github.com/tw93/Pake"
license=(custom:freeware)
conflicts=("${_pkgname}")
depends=('hicolor-icon-theme' 'gcc-libs' 'glib2' 'dbus' 'gtk3' 'gdk-pixbuf2' 'glibc' 'cairo' 'webkit2gtk' 'openssl-1.1' 'pango')
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/V${pkgver}/Loop_x86_64.deb"
    "LICENSE.html::https://go.microsoft.com/fwlink/?LinkID=206977")
sha256sums=('29d8bf31552b7e1332ebc4e80aeea5cf0ad38c3dd2c86ea7e39fa98c70fa4216'
            '206f4c1e01be824b58ac05b48a0196a76ee2ef7d8d285f255c1462b121bb6a7f')
package() {
    bsdtar -xvf data.tar.gz -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/apps/${_pkgname}"
    mv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/opt/apps/${_pkgname}/${_pkgname}"
    rm -rf "${pkgdir}/usr/share/applications" "${pkgdir}/usr/bin"
    gendesk -f --icon "loop" --categories "Utility" --name "loop" --exec "/opt/apps/${_pkgname}/${_pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    mv "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}