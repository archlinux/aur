# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=open-ecard-app-bin
pkgver=2.1.7
pkgrel=3
pkgdesc="Client side implementation of the eCard-API-Framework (BSI TR-03112) and related international standards, such as ISO/IEC 24727."
arch=('x86_64')
url="http://www.openecard.org/"
_githuburl="https://github.com/ecsec/open-ecard"
license=("Apache2" "BouncyCastle" "GPL" "GPL2" "LGPL" "MIT")
provides=("${pkgname%-app-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "openecardapp")
depends=('java-runtime' 'lcms2' 'libx11' 'libxrender' 'libjpeg6-turbo' 'libxext' 'libpng' 'glibc' \
    'harfbuzz' 'libxi' 'zlib' 'gcc-libs' 'libxtst' 'pcsclite' 'giflib' 'freetype2' 'alsa-lib')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb")
sha256sums=('140646747f8098fcfcef1c95763fde21b9d7fd7289c7ef2989d88470054c23d6')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}/bin/${pkgname%-bin}|${pkgname%-bin}|g;s|.png||g" \
        -i "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/bin/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/share/doc/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}