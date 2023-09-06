# Contributor: nalquas <nalquas.dev@gmail.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tvtower-bin
_pkgname=TVTower
pkgver=0.8.1
pkgrel=2
pkgdesc="A tribute to Mad TV. Written in BlitzMax, Lua and a bit of C."
arch=('x86_64')
url="https://www.tvtower.org/"
_githuburl="https://github.com/TVTower/TVTower"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libglvnd' 'freetype2' 'glibc' 'gcc-libs' 'libxcb' 'lib32-glu' 'lib32-libxcb' 'lib32-gcc-libs' 'lib32-libglvnd' 'lib32-glibc' 'lib32-freetype2')
makedepends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_20230322.zip")
sha256sums=('a72345b65968d95e425d823a277b47d3fca325b750ad01c4ed8ed8e831056898')
prepare() {
	mkdir -p "${srcdir}/${pkgname%-bin}/logfiles"
	chmod 755 "${srcdir}/${pkgname%-bin}/logfiles"
	bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/${pkgname%-bin}"
	rm -rf "${srcdir}/${pkgname%-bin}/"*.bat \
		   "${srcdir}/${pkgname%-bin}/"*.exe
	gendesk -f -n --categories "Game" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
	install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
	cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
	ln -sf "/opt/${pkgname%-bin}/${_pkgname}_Linux64" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/${pkgname%-bin}/LICENCE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname%-bin}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	touch "${pkgdir}/opt/${pkgname%-bin}/logfiles/log.ai1.txt"
	touch "${pkgdir}/opt/${pkgname%-bin}/logfiles/log.ai2.txt"
	touch "${pkgdir}/opt/${pkgname%-bin}/logfiles/log.ai3.txt"
	touch "${pkgdir}/opt/${pkgname%-bin}/logfiles/log.ai4.txt"
	touch "${pkgdir}/opt/${pkgname%-bin}/logfiles/log.app.txt"
	touch "${pkgdir}/opt/${pkgname%-bin}/logfiles/log.app.error.txt"
	touch "${pkgdir}/opt/${pkgname%-bin}/log.profiler.txt"
	chmod 777 "${pkgdir}/opt/${pkgname%-bin}/savegames"
	chmod 666 "${pkgdir}/opt/${pkgname%-bin}/log.profiler.txt" \
		"${pkgdir}/opt/${pkgname%-bin}/logfiles/"*
}