# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Contributor: Pawel Mizio <miziakmwa at gmail dot com>

pkgname=miniongg
pkgver=3.0.8.r1.48fdad7f
pkgrel=1
pkgdesc="Elder Scrolls Online and World of Warcraft Addon Manager"
arch=('any')
url='https://minion.mmoui.com/'
license=('custom')
depends=('jre-openjdk' 'java-openjfx')
makedepends=('unzip')
provides=("miniongg")

source=("https://cdn.mmoui.com/minion/v3/MinionClientUpdate-48fdad7fcd5baaa0510177f57ec85a03a893fe04.zip"
	"https://cdn.mmoui.com/minion/v3/MinionLibsUpdate-31.zip"
	"Minion-EULA.html::https://minion.mmoui.com/?license"
	"miniongg.sh"
	"minion.desktop")
md5sums=("193595631e47cc0aca6f03ef07484987"
	"b6f909221fb482e74da25ce3e579bb3a"
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
