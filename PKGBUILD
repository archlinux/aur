# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=reqnotes-bin
_pkgname=ReqNotes
pkgver=2.0
pkgrel=2
pkgdesc="Personal Notes Application, Cross platform desktop application, developed with .NET 6 and Avalonia UI"
arch=('x86_64')
url="https://github.com/ReqBaa/ReqNotes"
_downurl="https://raw.githubusercontent.com/ReqBaa/repo"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
depends=(
    'fontconfig'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_downurl}/main/pool/main/r/${pkgname%-bin}/${pkgname%-bin}_${pkgver}-0ubuntu1_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('068ecf059a5123269a62e4097169834bfb1d23c645cd07ff1987453e7ec063b4'
            '6756dcb750c56e02d43565cef9a92e42d73bd7a7b33056d5a3a70afa2aedf6cc')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|/usr/share/reqbaa/${pkgname%-bin}/${_pkgname}|${pkgname%-bin}|g" \
        -e "s|Categories=Note|Categories=Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -r "${srcdir}/usr/share/reqbaa/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/"* -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}