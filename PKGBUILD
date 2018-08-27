# Maintainer: Daniel Chatfield <chatfielddaniel@gmail.com>
pkgname=trello-bin
pkgver=0.1.9
pkgrel=2
pkgdesc="Unofficial Trello Desktop app"
arch=(any)
url="https://github.com/danielchatfield/trello-desktop"
license=('MIT')
depends=()
makedepends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}.zip::https://github.com/danielchatfield/${pkgname%-bin}-desktop/releases/download/v${pkgver}/Trello-linux-${pkgver}.zip"
		"${pkgname%-bin}.desktop"
		"${pkgname%-bin}.png")
md5sums=("65c8f18ea3461b1991489d4edbd9ee3e"
		 "c636a75cff12fb5f706c96fcf00d0ae9"
		 "ddf0e16e77fce510e2a67d6bdd16c433")
noextract=("${pkgname%-bin}.zip")

package() {
	cd "${srcdir}"

	install -m755 -d "${pkgdir}/opt/${pkgname%-bin}/"
	unzip "${srcdir}/${pkgname%-bin}.zip" -d "${pkgdir}/opt/${pkgname%-bin}/"
	install -m755 -d "${pkgdir}/usr/bin/"
	ln -s "/opt/${pkgname%-bin}/Trello" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -m755 -d "${pkgdir}/usr/share/licenses/"
	ln -s "/opt/${pkgname%-bin}/LICENSE" "${pkgdir}/usr/share/licenses/LICENSE"
	install -Dm0644 "${srcdir}/${pkgname%-bin}.desktop"	"${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
	#convert "${srcdir}/resources/app/static/Icon.ico" "${srcdir}/../${pkgname%-bin}.png"
	install -Dm0644 "${srcdir}/${pkgname%-bin}.png"		"${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
