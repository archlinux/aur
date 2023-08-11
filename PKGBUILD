# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dosbox-staging-bin
pkgver=0.80.1
pkgrel=2
pkgdesc="A modern continuation of DOSBox with advanced features and current development practices."
arch=("x86_64")
url="https://github.com/dosbox-staging/dosbox-staging"
license=('GPL2')
provides=("${pkgname%-bin}=${pkgver}" "${pkgname%-staging-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-staging-bin}")
depends=('glibc' 'alsa-lib' 'sdl2' 'hicolor-icon-theme' 'libglvnd' 'gcc-libs')
source=("${pkgname%-bin}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-v${pkgver}.tar.xz")
sha256sums=('12582a6496b1a276cd239e6b3d21ddfcd51fd8f9e40a1ebbc0a3800e0636190a')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/${pkgname%-bin}-linux-v${pkgver}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -s "/opt/${pkgname%-bin}/"${pkgname%-staging-bin}"" "${pkgdir}/usr/bin/"${pkgname%-staging-bin}""
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/desktop/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/doc/manual.txt" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/man/"${pkgname%-staging-bin}".1" -t "${pkgdir}/usr/share/man/man1"
    for _icons in 16x16 22x22 24x24 32x32 scalable;do
        install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/icons/hicolor/${_icons}/apps/${pkgname%-bin}".* -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}