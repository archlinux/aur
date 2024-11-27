# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=netmount-bin
_pkgname=NetMount
pkgver=1.1.1
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
)
options=(
    '!strip'
)
source=("${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('b89a87d0c63af048b3fcab46366ae55b68c78e1f71dc21902fce61e249294a12')
build() {
	bsdtar -xf "${srcdir}/data."*
}

package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib" "${pkgdir}/usr"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/712x712/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
