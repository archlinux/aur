# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lotti-bin
pkgver=0.9.395_2291
pkgrel=2
pkgdesc="Achieve your goals and keep your data private with Lotti. This life tracking app is designed to help you stay motivated and on track, all while keeping your personal information safe and secure. Now with on-device speech recognition."
arch=('x86_64')
url="https://github.com/matthiasn/lotti"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('pango' 'gdk-pixbuf2' 'jsoncpp' 'gtk3' 'gcc-libs' 'libkeybinder3' 'libsecret' 'libepoxy' 'cairo' 'glib2' 'at-spi2-core' 'harfbuzz' 'glibc' 'sqlite')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/${pkgver//_/+}/linux.x64.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/matthiasn/lotti/main/assets/icon/app_icon_1024.png")
noextract=("${pkgname%-bin}-${pkgver}.tar.gz")
sha256sums=('585ba9745dd626da5aa14fcb1db0ef7d71e6ed0dfb507969df01001db36eac0d'
            '306adaeff6c8613e536db665d24cab8551b4a3774c5729492dd132dc690256c6')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.tar.gz" -C "${pkgdir}/opt/${pkgname%-bin}" --gname root --uname root
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}