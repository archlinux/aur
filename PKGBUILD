# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>
# Contributor: TrialnError <autumn-wind@web.de>
pkgname=coolterm-bin
_pkgname=CoolTerm
pkgver=2.0.1
pkgrel=5
pkgdesc="Simple GUI serial port terminal application (no terminal emulation)"
arch=(
	"aarch64"
	"armv7h"
	"i686"
	"x86_64"
)
url="https://freeware.the-meiers.org"
license=("custom")
conflicts=("${pkgname%-bin}")
depends=(
	'gtk3'
	'python'
	'python-psutil'
	'libunwind'
	'at-spi2-core'
	'gdk-pixbuf2'
	'cairo'
	'pango'
	'libx11'
	'libunwind'
)
makedepends=(
	'gendesk'
)
source=(
	"${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/${_pkgname}RaspberryPi64Bit.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/${_pkgname}RaspberryPi.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/${_pkgname}Linux32Bit.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/${_pkgname}Linux64Bit.zip")
sha256sums=('d3a6af518a2ce92bb90c615d53aa8c27fde266697fb6fd6c1ac1ca89febfe2ee')
sha256sums_aarch64=('c10c0b9b8432c49a9e6ae77e68941036ea5e35a3dde6713b0fc3b74ba18c93ea')
sha256sums_armv7h=('258ab48d00698536585a2fcc1a0b3d5fb2ebb704776bf60d82d8c46ed4311c59')
sha256sums_i686=('fb4072c5a37744bd685e19d1fd63f649ac9824512cb1e860f24128dfc2172ab4')
sha256sums_x86_64=('5b5c2d620d20e19f8e9aeef463ee2dcc23f7c843b6da2e36da05f045d6d668ce')
build() {
	sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runappname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
	gendesk -q -f -n --categories "System;Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
	find "${srcdir}/${_pkgname}"*/Scripting/Python/Examples -name "*.py" -exec chmod 755 {} \;
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
	cp -r "${srcdir}/${_pkgname}"*/* "${pkgdir}/opt/${pkgname%-bin}"
	install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${_pkgname} Resources/Help/app_icon_256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
	install -Dm644 "${srcdir}/${_pkgname}"*/ReadMe.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}