# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quasar-todo-bin
_pkgname=Quasar-Todo
pkgver=0.1.2
pkgrel=2
pkgdesc="Playing with Quasar CLI by making a simple to-do list"
arch=('x86_64')
url="https://github.com/spenserblack/quasar-todo"
license=('MIT')
provides=("${pkgname%-bin}")
conflits=("${pkgname%-bin}")
depends=('bash' 'electron22')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/spenserblack/quasar-todo/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('842a8ebef866fdc6d6fbd31c48143e776b7949aec3b991446c71cae5105419bb'
            '0cadd467ba2b1f8ad00eb2c55c458c250d6f70a661a0aff1acb905777353c997'
            '839559e6c7e5ac40f6d15a41b92e972026759921120bbd5388d073d9491a4877')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}