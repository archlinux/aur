# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=laravel-kit-bin
_pkgname="Laravel Kit"
pkgver=2.0.8
pkgrel=1
pkgdesc="A simple and elegant desktop application for managing your Laravel applications."
arch=("x86_64")
url="https://github.com/tmdh/laravel-kit"
license=('GPL2')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron21' 'php')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('bd3d62e1d11968c76a287e2588757279533afce17ae78c321b93e08ad9f482dd'
            '35ccc76d0e709639f6f6fe29c949ace5db2aa1208623eba20f731f609e4e66a7')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar p "${srcdir}/opt/${_pkgname}/resources/app" "${srcdir}/app.asar"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}