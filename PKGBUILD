# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quasar-todo-bin
_pkgname=Quasar-Todo
pkgver=0.1.4
pkgrel=1
pkgdesc="Playing with Quasar CLI by making a simple to-do list"
arch=('x86_64')
url="https://github.com/spenserblack/quasar-todo"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron22')
makedepends=('squashfuse')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/spenserblack/quasar-todo/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('3f0bb12701d72751f5ad8937e09d9d5c3e0bb9fdfe998af0edb63203cb29d9a4'
            '0cadd467ba2b1f8ad00eb2c55c458c250d6f70a661a0aff1acb905777353c997'
            'f6ef5a32ae25ed1ee6bf9ce21440704b70bb73e80ce0a8ee3b6c4452ad3b9198')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}