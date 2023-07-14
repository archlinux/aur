# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=horanghill-bin
pkgver=0.4.8
pkgrel=2
pkgdesc="Simple 3D Editor"
arch=('x86_64')
url="http://horanghill.great-site.net/"
_githuburl="https://github.com/HorangStudios/Editor"
license=('AGPL3')
conflits=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('bash' 'hicolor-icon-theme' 'electron4')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('4c9e0ef661ecb2174d8e4ae173eb68f0d82033d7913342005a5af6cd746a8cb5'
            '5dcaa14a5a7e412053f03974982e77d813d96c39c18701a24e32cd8ec6f4b4f3')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin} editor/resources/"* -t "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|\"/opt/${pkgname%-bin} editor/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}