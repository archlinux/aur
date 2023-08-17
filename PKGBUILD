# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: zhuangzhuang <xufengyuan20080802@outlook.com>
pkgname=rubick-bin
pkgver=2.4.2
pkgrel=1
pkgdesc="Electron based open source toolbox, free integration of rich plug-ins. 基于 electron 的开源工具箱，自由集成丰富插件。"
arch=('x86_64')
url="https://rubickcenter.github.io/rubick/"
_githuburl="https://github.com/rubickCenter/rubick"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron13' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
	"LICENSE::https://raw.githubusercontent.com/rubickCenter/rubick/master/LICENSE"
	"${pkgname%-bin}.sh")
sha256sums=('cc268bc5d80ba3ece504b8f422a37debfdd76a601cfd1f3175e89f4b08efdae3'
            '98ec3482acc93db8661b6a794744e5eaca088cf75312d15f196abb5db7e52b77'
            '9909796606e292ef996c729c89049c7b07ab5ff5fb34e59b143df8eac99227ab')
package(){
	bsdtar -xf "${srcdir}/data.tar.xz"
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}2/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 2x2 3x3 256x256;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
	sed "s|/opt/${pkgname%-bin}2/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}