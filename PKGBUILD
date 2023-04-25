# Contributor: nalquas <nalquas.dev@gmail.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tvtower-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="A tribute to Mad TV. Written in BlitzMax, Lua and a bit of C."
arch=('x86_64')
url="https://www.tvtower.org/"
_githuburl="https://github.com/TVTower/TVTower"
license=('custom')
depends=('libglvnd' 'freetype2' 'glibc' 'gcc-libs' 'libxcb')
makedepends=('gendesk')
provides=()
noextract=("${pkgname}-${pkgver}.zip")
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/TVTower_v${pkgver}_20230322.zip")
sha256sums=('a72345b65968d95e425d823a277b47d3fca325b750ad01c4ed8ed8e831056898')

package() {
	install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
	bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${pkgdir}/opt/${pkgname%-bin}" --gname root --uname root
	install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENCE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
	gendesk -f --icon "${pkgname%-bin}" --categories "Game" --name "TVTower" --exec "/opt/${pkgname%-bin}/TVTower_Linux64"
	install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	find "${pkgdir}/opt" -type f -exec chmod 644 {} \;
	find "${pkgdir}/opt" -type d -exec chmod 755 {} \;
	chmod +x "${pkgdir}/opt/${pkgname%-bin}/TVTower_Linux64"
	install -Dm777 -d "${pkgdir}/opt/${pkgname%-bin}/logfiles"
	touch "${pkgdir}/opt/${pkgname%-bin}/logfiles/log.ai1.txt"
	touch "${pkgdir}/opt/${pkgname%-bin}/logfiles/log.ai2.txt"
	touch "${pkgdir}/opt/${pkgname%-bin}/logfiles/log.ai3.txt"
	touch "${pkgdir}/opt/${pkgname%-bin}/logfiles/log.ai4.txt"
	touch "${pkgdir}/opt/${pkgname%-bin}/logfiles/log.app.txt"
	touch "${pkgdir}/opt/${pkgname%-bin}/logfiles/log.app.error.txt"
	touch "${pkgdir}/opt/${pkgname%-bin}/log.profiler.txt"
	chmod -R 777 "${pkgdir}/opt/${pkgname%-bin}/log.profiler.txt" "${pkgdir}/opt/${pkgname%-bin}/logfiles" "${pkgdir}/opt/${pkgname%-bin}/savegames"
}