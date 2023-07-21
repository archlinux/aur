# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=visualfamilytree-bin
_pkgname=visual-family-tree
pkgver=1.4.0
pkgrel=2
pkgdesc="Create a family tree with extensive information and pictures about the individual family members."
arch=('x86_64')
url="https://visualfamilytree.jisco.me"
_githuburl="https://github.com/Jisco/VisualFamilyTree"
license=('custom:freeware')
conflits=("${pkgname%-bin}")
depends=('bash' 'hicolor-icon-theme' 'electron11')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/VisualFamilyTree.${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/Jisco/VisualFamilyTree/master/README.md"
    "${pkgname%-bin}.sh")
sha256sums=('2182a8d0554b1c1811c12e43d093300a50fd438e305272e65da2db72d8eabc5a'
            '1e28e02b99e91ce1bf896f3c6694dc1475feea02318d69b371181c1fb8b69d97'
            '6e877523026a18e47aa60fb970ad7b2830b361ab28246778b26f54c3193ec2e6')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/Visual Family Tree/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed "s|\"/opt/Visual Family Tree/${_pkgname}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon-${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}