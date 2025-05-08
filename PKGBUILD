# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=netmount-bin
_pkgname=NetMount
pkgver=1.1.2
pkgrel=1
pkgdesc="Unified management and mounting of cloud storage facilities.(Prebuilt version)统一管理和挂载云存储设施"
arch=('x86_64')
url="http://netmount.cn/"
_ghurl="https://github.com/VirtualHotBar/NetMount"
license=('AGPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'rclone'
    'alist'
)
options=(
    '!strip'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('3b8700724fcf9f21b0dd36b56c3569018957c776a90b80401bff8163433cc74f')
prepare() {
    ln -sf "/usr/bin/rclone" "${srcdir}/usr/lib/${pkgname%-bin}/res/bin/rclone"
    ln -sf "/usr/bin/alist" "${srcdir}/usr/lib/${pkgname%-bin}/res/bin/alist/alist"
}
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib" "${pkgdir}/usr"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/712x712/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}