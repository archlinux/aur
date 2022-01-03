# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Contributor: Pawel Mizio <miziakmwa at gmail dot com>

pkgname=miniongg
pkgver=3.0.9.r1.9aeb2f21
pkgrel=1
pkgdesc="Elder Scrolls Online and World of Warcraft Addon Manager"
arch=('any')
url='https://minion.mmoui.com/'
license=('custom')
depends=('jre-openjdk' 'java-openjfx')
makedepends=('unzip')
provides=("miniongg")

source=("https://cdn.mmoui.com/minion/v3/MinionClientUpdate-9aeb2f21d334d495253cdd8364859ca5ce90b9db.zip"
	"https://cdn.mmoui.com/minion/v3/MinionLibsUpdate-32.zip"
	"Minion-EULA.html::https://minion.mmoui.com/?license"
	"miniongg.sh"
	"minion.desktop")
md5sums=("0dee919c8a16af52a4cf61dca1d00486"
	"afc7ce623dbae08643aa0246983ac607"
	"SKIP"
	"ac963b2368a1db40b44d7a3b147546d4"
	"cb92061ae2d15effbddc3b23600cfeaf")

package() {
	mkdir -p "${pkgdir}/usr/share/java/minion/"
	cp -r "${srcdir}/lib" "${pkgdir}/usr/share/java/minion/"
	cp -r "${srcdir}/Minion-jfx.jar" "${pkgdir}/usr/share/java/minion/"

	for _size in "32" "64" "128" "256" "512"
	do
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps"
		unzip -p Minion-jfx.jar "gg/minion/image/minion-${_size}.png" > "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/minion.png"
	done

	install -Dm 755 "${srcdir}/miniongg.sh" "${pkgdir}/usr/bin/miniongg"
	install -Dm 644 "${srcdir}/minion.desktop" "${pkgdir}/usr/share/applications/minion.desktop"
	install -Dm 644 "${srcdir}/Minion-EULA.html" "${pkgdir}/usr/share/licenses/${pkgname}/Minion-EULA.html"
}
