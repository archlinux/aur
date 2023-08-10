# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=acodec-bin
pkgver=2.5.3
pkgrel=3
pkgdesc="Encoder & decoder for various algorithms with graphical user interface."
arch=("aarch64" "armv7h" "i686" "x86_64")
url="https://github.com/albertus82/acodec"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('java-runtime' 'hicolor-icon-theme' 'sh')
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-gtk-linux-armhf-bin.tar.gz")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-gtk-linux-aarch64-bin.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-gtk-linux-x86-bin.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-gtk-linux-x86_64-bin.tar.gz")
sha256sums_aarch64=('10f8dd863dba60161595816e80a33b55017d6f271b81b836a3481c6f9cf5289d')
sha256sums_armv7h=('37c56e6f284ad91162956d37b35d46d7d12aed724cf2aaf8a80466abb086275d')
sha256sums_i686=('410987e5d2ce450c93c09d1a4e77f82d3d5feea263cae00d4a223c4ead651656')
sha256sums_x86_64=('484305580b11565c256057db00d3c5f2be27575a763bc66912c18f65205d9c93')
package() {
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}/opt"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 20x20 24x24 32x32 40x40 48x48 64x64 96x96 128x128 256x256;do
        install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/icon/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}.sh"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}w.desktop"
    sed "s|Name=${pkgname%-bin}|Name=${pkgname%-bin}w|g;s|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}.sh|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}w.sh|g" \
        -i "${pkgdir}/usr/share/applications/${pkgname%-bin}w.desktop"
    ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}w.sh" "${pkgdir}/usr/bin/${pkgname%-bin}w"
}