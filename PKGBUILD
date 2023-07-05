# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=altair-bin
pkgver=5.0.28
pkgrel=2
pkgdesc="A beautiful feature-rich GraphQL Client for all platforms."
arch=('x86_64')
url="https://altairgraphql.dev/"
_githuburl="https://github.com/altair-graphql/altair"
license=('MIT')
conflits=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('electron' 'hicolor-icon-theme' 'sh')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64_linux.deb"
    "${pkgname%-bin}.sh")
sha256sums=('58e73a836bb49dbdaf9f2b0b004ebbb9e5cf1ca2d22bf963630a784205194aac'
            '11ff18e782f5dc59361f8ac3b5c9983331fdb6d7e482a8e0361c6a141d4d4089')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm644 "${srcdir}/opt/Altair GraphQL Client/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/Altair GraphQL Client/"LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -r "${srcdir}/usr" "${pkgdir}"
    sed "s|Exec=\"/opt/Altair GraphQL Client/altair\" %U|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}