# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=loop
pkgname="microsoft-${_pkgname}-pake"
_appname="com-tw93-${_pkgname}"
pkgver=2.0.0
pkgrel=2
pkgdesc="Use Pake to package Microsoft Loop.Microsoft Loop is about people—people who want to create together with ease, no matter where they are or what tools they use. "
arch=('x86_64')
url="https://www.microsoft.com/en-us/microsoft-loop"
_githuburl="https://github.com/tw93/Pake"
license=(custom:freeware)
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glib2' 'dbus' 'gtk3' 'gdk-pixbuf2' 'glibc' 'cairo' 'webkit2gtk' 'openssl-1.1' 'pango')
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/V${pkgver}/Loop_x86_64.deb"
    "LICENSE.html::https://www.microsoft.com/en-us/legal/terms-of-use")
sha256sums=('29d8bf31552b7e1332ebc4e80aeea5cf0ad38c3dd2c86ea7e39fa98c70fa4216'
            '0a3fe62a333a48833073056c1883a4ca7511bfbfed09746b1824e37420ee67ab')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|${_appname}|${pkgname%-pake}|g" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-pake}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-pake}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-pake}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}