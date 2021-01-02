# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Contributor: Pawel Mizio <miziakmwa at gmail dot com>

pkgname=miniongg
pkgver=3.0.7_SNAPSHOT.r1.12dbc95e
pkgrel=5
pkgdesc="Elder Scrolls Online and World of Warcraft Addon Manager"
arch=('any')
url='https://minion.mmoui.com/'
license=('custom')
depends=('jre-openjdk' 'java-openjfx')
makedepends=('unzip')
provides=("miniongg")

source=("https://cdn.mmoui.com/minion/v3/MinionClientUpdate-12dbc95eff5898a64f584a3c697dad987c604af8.zip"
	"https://cdn.mmoui.com/minion/v3/MinionLibsUpdate-81fcfa6cd281365b8e6c40c51e2fc931caf4101d.zip"
	"Minion-EULA.html::https://minion.mmoui.com/?license"
	"miniongg.sh"
	"minion.desktop")
md5sums=("977dcbe4914fe452055d092083960f4c"
	"862307f1f506b42a576c8d49e90eccbf"
	"SKIP"
	"c758cbb772d9878451c51f1c5d8f8353"
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
