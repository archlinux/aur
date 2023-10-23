# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: zhuangzhuang <xufengyuan20080802@outlook.com>
pkgname=rubick-bin
pkgver=4.0.9
pkgrel=1
pkgdesc="Electron based open source toolbox, free integration of rich plug-ins. 基于 electron 的开源工具箱，自由集成丰富插件。"
arch=('x86_64')
url="https://rubickcenter.github.io/rubick/"
_githuburl="https://github.com/rubickCenter/rubick"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
	"LICENSE::https://raw.githubusercontent.com/rubickCenter/rubick/v${pkgver}/LICENSE"
	"${pkgname%-bin}.sh")
sha256sums=('e6804234b32a5e127f20ba92d1c2fb88a6bfdfe251fc5a051b0ec26481776d0d'
            '98ec3482acc93db8661b6a794744e5eaca088cf75312d15f196abb5db7e52b77'
            '35becc7e711518fb0f396742aaba1ec4480fc0ea452b088ab830ae2b5d79889e')
build() {
	bsdtar -xf "${srcdir}/data.tar.xz"
	unlink "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/extract-file-icon/build/node_gyp_bins/python3"
	sed "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package(){
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
	cp -r "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/opt/${pkgname%-bin}/resources"
	ln -sf "/usr/bin/python3" "${pkgdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/extract-file-icon/build/node_gyp_bins/python3"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}