# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=open-ecard-app-bin
pkgver=2.1.9
pkgrel=1
pkgdesc="Client side implementation of the eCard-API-Framework (BSI TR-03112) and related international standards, such as ISO/IEC 24727."
arch=('x86_64')
url="http://www.openecard.org/"
_ghurl="https://github.com/ecsec/open-ecard"
license=("Apache" "custom:BouncyCastle" "GPL" "GPL2" "LGPL" "MIT")
provides=("${pkgname%-app-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "openecardapp")
depends=(
    'java-runtime'
    'lcms2'
    'libx11'
    'libxrender'
    'libjpeg6-turbo'
    'libxext'
    'libpng'
    'harfbuzz'
    'libxi'
    'libxtst'
    'pcsclite'
    'giflib'
    'freetype2'
    'alsa-lib'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb"
)
sha256sums=('c138daed80f7162762b6e1d476c8529ba1d3ffef23d6b8aae6a1f04920d7d636')
build() {
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