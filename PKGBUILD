# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Contributor: Pawel Mizio <miziakmwa at gmail dot com>

pkgname=miniongg
pkgver=3.0.11.r1.5710ea73
pkgrel=1
pkgdesc="Elder Scrolls Online and World of Warcraft Addon Manager"
arch=('any')
url='https://minion.mmoui.com/'
license=('custom')
depends=('java-runtime' 'java-openjfx')
makedepends=('unzip')
provides=("miniongg")

source=("https://cdn.mmoui.com/minion/v3/MinionClientUpdate-5710ea736478fd7193e68b70defc0ee404ba4576.zip"
	"https://cdn.mmoui.com/minion/v3/MinionLibsUpdate-34.zip"
	"Minion-EULA.html::https://minion.mmoui.com/?license"
	"miniongg.sh"
	"minion.desktop")
md5sums=("f77afcb80189172d20801ebcd2dc03d3"
	"f898b87eabed14af121639bc1c2d6151"
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
