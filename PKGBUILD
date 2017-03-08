# Maintainer: Daniel Chatfield <chatfielddaniel@gmail.com>
pkgname=trello-git
pkgver=0.1.1
pkgrel=1
pkgdesc="Unofficial Trello Desktop app"
arch=(any)
url="https://github.com/danielchatfield/trello-desktop"
license=('MIT')
depends=("electron")
makedepends=("git" "asar" "npm")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-git}::git+https://github.com/danielchatfield/${pkgname%-git}-desktop.git"
		"${pkgname%-git}.desktop"
		"${pkgname%-git}.sh")
md5sums=("SKIP"
		 "c636a75cff12fb5f706c96fcf00d0ae9"
		 "9137be0a6adff89a3e545341f2bfc37c")

build() {
	cd "${srcdir}/${pkgname%-git}"
	npm install --production
	asar p "${srcdir}/${pkgname%-git}" "${srcdir}/${pkgname%-git}.asar"
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	install -Dm0755 "${srcdir}/${pkgname%-git}.sh"				"${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm0755 "${srcdir}/${pkgname%-git}.asar"			"${pkgdir}/usr/lib/${pkgname%-git}/${pkgname%-git}.asar"
	install -Dm0644 "${srcdir}/${pkgname%-git}.desktop"			"${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
	install -Dm0644 "${srcdir}/${pkgname%-git}/static/Icon.png"	"${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
	install -Dm0644 "${srcdir}/${pkgname%-git}/LICENSE"			"${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
