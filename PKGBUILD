# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stackzy-bin
_appname=Stackzy
pkgver=1.2.6
pkgrel=1
pkgdesc="A cross-platform desktop application to identify libraries used inside an android application. Made possible by Compose Desktop"
arch=('x86_64')
url="https://github.com/theapache64/stackzy"
license=("Apache")
provides=("${pkgname%-bin}=${pkgver}")
confilcts=("${pkgname%-bin}")
depends=('libxtst' 'libglvnd' 'fontconfig' 'java-runtime' 'libxrender' 'alsa-lib' 'glibc' 'libxi' 'libxext' 'libx11' 'zlib')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/theapache64/stackzy/master/LICENSE")
sha256sums=('be46f24ab891c1c3007715ceb539b006f281d445743ab77195c7c6f47cafbdeb'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    sed "s|/opt/${pkgname%-bin}/lib/${_appname}.png|${pkgname%-bin}|g;s|Unknown|Utility;Development;|g" \
        -i "${pkgdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_appname}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/lib/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}