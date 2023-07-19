# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="sengi-bin"
pkgver=1.6.3
pkgrel=2
pkgdesc="Mastodon & Pleroma Multi-account Desktop Client"
arch=('x86_64')
url="https://github.com/NicolasConstant/sengi"
_downurl="https://github.com/NicolasConstant/sengi-electron"
license=('AGPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('bash' 'electron23' 'hicolor-icon-theme')
source=("${pkgname%-bin}${pkgver}.deb::${_downurl}/releases/download/v${pkgver}/Sengi-${pkgver}-linux.deb"
    "${pkgname%-bin}.sh")
sha256sums=('d1f0244ec5e9d46a1c859c0f0372f4fd505de9a7454b98d48854064b757f513c'
            '3297ce82a0ab326fb12837b47d9356b6d3290579e2eacd822869a04e0e3f3e71')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" #-C "${pkgdir}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/Sengi/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|/opt/Sengi/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}