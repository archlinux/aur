# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=acodec-bin
_pkgname=ACodec
pkgver=2.5.5
pkgrel=1
pkgdesc="Encoder & decoder for various algorithms with graphical user interface."
arch=(
    "aarch64"
    "armv7h"
    "i686"
    "x86_64"
)
url="https://github.com/albertus82/acodec"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'java-runtime'
)
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-gtk-linux-armhf-bin.tar.gz")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-gtk-linux-aarch64-bin.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-gtk-linux-x86-bin.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-gtk-linux-x86_64-bin.tar.gz")
sha256sums_aarch64=('cee2d61fc1b077d620c09cb6e3e989587d23d7472781d6e44e01805f5a3f5656')
sha256sums_armv7h=('20208ee3c85fc57b2c5084193d39b2db5404c5c26238b7439fcd13bffb8be2a5')
sha256sums_i686=('9acd98f1246633388746bc37f314a8bb281e49d839dad037f5befa7d70ad715d')
sha256sums_x86_64=('81aa0edf486a5a728c724b12d765678e4a15820732462b5d8a5a7d5725dd14ba')
build() {
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin}"
    cp "${srcdir}/${pkgname%-bin}.desktop" "${srcdir}/${pkgname%-bin}w.desktop"
    sed "s|Name=${_pkgname}|Name=${_pkgname}-w|g;s|Exec=${pkgname%-bin}|Exec=${pkgname%-bin}w|g" \
        -i "${srcdir}/${pkgname%-bin}w.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,/usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}w.sh" "${pkgdir}/usr/bin/${pkgname%-bin}w"
    install -Dm644 "${srcdir}/${pkgname%-bin}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256;do
        install -Dm644 "${srcdir}/${pkgname%-bin}/icon/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}w.desktop" -t "${pkgdir}/usr/share/applications"
}