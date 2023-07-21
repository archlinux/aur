# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="frappe-books-bin"
pkgver=0.17.1
pkgrel=1
pkgdesc="Modern desktop accounting for freelancers and small-businesses."
arch=('x86_64')
url="https://frappebooks.com/"
_githuburl="https://github.com/frappe/books"
license=('AGPL3')
conflicts=("${pkgname%-bin}" "frappebooks")
provides=("${pkgname%-bin}")
depends=('electron18' 'hicolor-icon-theme' 'bash' 'gcc-libs' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('0a7f95319fbc46510bef23ff1ee67b310f743243a5050e01349e288291e82493'
            'fcdf0c13cc7b4fa5d6f7f9773cbc5b94a0d21c4b2b168abcc4e9f952c91d3d5c')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/Frappe Books/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|\"/opt/Frappe Books/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Finance|Finance;Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}