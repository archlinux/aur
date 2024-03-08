# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=acodec-bin
_pkgname=ACodec
pkgver=2.5.4
pkgrel=5
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
    'hicolor-icon-theme'
)
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-gtk-linux-armhf-bin.tar.gz")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-gtk-linux-aarch64-bin.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-gtk-linux-x86-bin.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-gtk-linux-x86_64-bin.tar.gz")
sha256sums_aarch64=('6cd4820eb31ba2aaf8d83d7fb250c248a97a90f0d3b651501ce10187922483bf')
sha256sums_armv7h=('326442abe0b053e571d1bafe08a2ab7d1a26d14488b5f9473c7f7eeaa8fb7dd3')
sha256sums_i686=('32e94dae17ff3e80341d4d5ebcb4a503e6b6c73a9a74e27c24cfa60771d5a342')
sha256sums_x86_64=('42ba192af6a7b23ee11a9568ece9e7a3cb32ca99e9088b9cc8211c45b6e7b364')
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