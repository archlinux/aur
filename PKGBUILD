# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="open-ecard-app-bin"
pkgver=2.1.6
pkgrel=2
pkgdesc="Client side implementation of the eCard-API-Framework (BSI TR-03112) and related international standards, such as ISO/IEC 24727."
arch=('x86_64')
url="http://www.openecard.org/"
_githuburl="https://github.com/ecsec/open-ecard"
license=("Apache2" "BouncyCastle" "GPL" "GPL2" "LGPL" "MIT")
providers=(ecsec)
conflicts=("${pkgname%-bin}" "openecardapp" "${pkgname%-bin}-git")
depends=('java-runtime' 'lcms2' 'libx11' 'libxrender' 'libjpeg6-turbo' 'libxext' 'libpng' 'glibc' \
    'hicolor-icon-theme' 'harfbuzz' 'libxi' 'zlib' 'gcc-libs' 'libxtst' 'pcsclite' 'giflib' 'freetype2' 'alsa-lib')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb"
    "LICENSE.Apache2::${_githuburl}/raw/master/LICENSE.Apache2"
    "LICENSE.BouncyCastle::${_githuburl}/raw/master/LICENSE.BouncyCastle")
sha256sums=('4c131060823d474897086bf72fdf6cebb77f528ac5ea370c84e844ed301575d4'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            '8137d0fbe30981aa23ee0507994b5af3fb8ead0336c3c1a1bb637be4c01e86e9')
 
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    sed 's|/opt/open-ecard-app/lib/||g' -i "${pkgdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}"/LICENSE.* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}