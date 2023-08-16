# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=open-ecard-app-bin
pkgver=2.1.7
pkgrel=2
pkgdesc="Client side implementation of the eCard-API-Framework (BSI TR-03112) and related international standards, such as ISO/IEC 24727."
arch=('x86_64')
url="http://www.openecard.org/"
_githuburl="https://github.com/ecsec/open-ecard"
license=("Apache2" "BouncyCastle" "GPL" "GPL2" "LGPL" "MIT")
provides=("${pkgname%-app-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "openecardapp")
depends=('java-runtime' 'lcms2' 'libx11' 'libxrender' 'libjpeg6-turbo' 'libxext' 'libpng' 'glibc' \
    'hicolor-icon-theme' 'harfbuzz' 'libxi' 'zlib' 'gcc-libs' 'libxtst' 'pcsclite' 'giflib' 'freetype2' 'alsa-lib')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb"
    "LICENSE.Apache2::https://raw.githubusercontent.com/ecsec/open-ecard/master/LICENSE.Apache2"
    "LICENSE.BouncyCastle::https://raw.githubusercontent.com/ecsec/open-ecard/master/LICENSE.BouncyCastle")
sha256sums=('140646747f8098fcfcef1c95763fde21b9d7fd7289c7ef2989d88470054c23d6'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            '8137d0fbe30981aa23ee0507994b5af3fb8ead0336c3c1a1bb637be4c01e86e9')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    sed "s|/opt/${pkgname%-bin}/lib/||g" -i "${pkgdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}"/LICENSE.* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}