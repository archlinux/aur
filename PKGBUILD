# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=certmanager-bin
_pkgname=CertManager
_uosname="cn.bitnum.${pkgname%-bin}"
pkgver=1.0.0
pkgrel=4
pkgdesc="A simple and efficient local certificate management tool that provides functions such as certificate installation, certificate management, and certificate verification.一款简单高效的本地证书管理工具,提供证书安装、证书管理、证书验证等功能，支持国密证书."
arch=('x86_64')
url="http://www.bitnum.com/"
_dlurl="https://com-store-packages.uniontech.com/pool/appstore"
license=('LicenseRef-custom')
depends=(
    'qt6-base'
    'libglvnd'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_dlurl}/c/${_uosname}/${_uosname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('e5e15c046381827d6558e4cd351b73934c3812546fc85204259ea2a20e2febd9'
            'a9783526d93e6c72c7e1551cc5cc513fd6056dcc4593abe8fac815721d32dd5a')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    rm -rf "${srcdir}/opt/apps/${_uosname}/files/证书管理器"
    sed -e "s|/opt/apps/${_uosname}/files/${_pkgname}|${pkgname%-bin} %U|g" \
        -e "s|/opt/apps/${_uosname}/entries/icons/icon.png|${pkgname%-bin}|g" \
        -i "${srcdir}/opt/apps/${_uosname}/entries/applications/${_uosname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/apps/${_uosname}/files/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_uosname}/entries/applications/${_uosname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${_uosname}/entries/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}