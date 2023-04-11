# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=loop
pkgname="microsoft-${_pkgname}-pake"
_appname="com-tw93-${_pkgname}"
pkgver=2.0.0alpha
_pkgver=2.0.0-alpha
pkgrel=1
pkgdesc="Use Pake to package Microsoft Loop.Microsoft Loop is about people—people who want to create together with ease, no matter where they are or what tools they use. "
arch=('x86_64')
url="https://www.microsoft.com/en-us/microsoft-loop"
_githuburl="https://github.com/tw93/Pake"
license=(custom:freeware)
conflicts=("${_pkgname}")
depends=('hicolor-icon-theme' 'gcc-libs' 'glib2' 'dbus' 'gtk3' 'gdk-pixbuf2' 'glibc' 'cairo' 'webkit2gtk' 'openssl-1.1')
source=("${_pkgname}-${_pkgver}.deb::${_githuburl}/releases/download/V${_pkgver}/Loop_x86_64.deb"
    "LICENSE.html::https://go.microsoft.com/fwlink/?LinkID=206977")
sha256sums=('13a84044e7fea593edc7a1333a8a7e89e95e3808cf2acdcbc1a7ff053fa00a42'
            '9e14c7405b2c75f2fc0bb8c68f52415b16034178de764f3bac2114cbb7029046')
package() {
    bsdtar -xvf data.tar.gz -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/apps/${_pkgname}"
    mv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/opt/apps/${_pkgname}/${_pkgname}"
    rm -rf "${pkgdir}/usr/share/applications" "${pkgdir}/usr/bin"
    gendesk -f --pkgname "${_pkgname}" --pkgdesc "Microsoft Loop is about people—people who want to create together with ease, no matter where they are or what tools they use. " \
        --icon "${_pkgname}" --categories "Utility;" --name "${_pkgname}" --exec "/opt/apps/${_pkgname}/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    mv "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
