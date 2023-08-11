# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deskaide-bin
_appname=Deskaide
pkgver=1.0.0_alpha.16
pkgrel=2
pkgdesc="An aide to your desk life!"
arch=('x86_64')
url="https://github.com/deskaide/deskaide"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron22' 'hicolor-icon-theme' 'glibc' 'gcc-libs' 'lib32-gcc-libs' 'lib32-glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/deskaide/deskaide/develop/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('4abe8efb3fb909daf2f9034bc164155f77a9033a3699802c6ceb5ea3b32610b5'
            '60fcc2fb41c30d5afc1767a98ddec84656bdd10e2f563c0fb11cba23c5cbc271'
            'df6fdc7764774ceb4f5acbcc2f472d5f467b36a1588f15c85c7b2d6b9dcb28e6')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 24x24 32x32 48x48 72x72 96x96 128x128 144x144 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}