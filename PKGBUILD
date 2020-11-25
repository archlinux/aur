# Maintainer: Valentijn "noirscape" V. <neko at catgirlsin dot space>
# Contributor: YoyPa <yoann dot p dot public at gmail dot com>
pkgname=fluffy-switch
pkgver=2.9.2
_pkgver=2.9 # git tag version
pkgrel=2
pkgdesc="Goldtree and Tinfoil GUI for USB/Network install on switch"
arch=('any')
url="https://github.com/fourminute/Fluffy"
license=('GPL')
depends=(
	'python-pyusb'
	'libusb'
	'python-pyqt5'
	'tk'
)
optdepends=(
	'python-qdarkstyle: dark theme toggle in fluffy'
)
source=("Fluffy-${_pkgver}.tar.gz::https://github.com/fourminute/Fluffy/archive/v${_pkgver}.tar.gz")
sha256sums=('c063bf746b944810ff3f34bd70efe8f6807713630f0cc4b98aec3350cde5e651')

# Remove .desktop file PATH (/tmp).
prepare() {
	cd "Fluffy-${_pkgver}"
	sed -e "s|Path=\/tmp||" -i linux/fluffy.desktop
}

package() {
	cd "Fluffy-${_pkgver}"
	install -Dm 644 linux/80-fluffy-switch.rules "${pkgdir}/usr/lib/udev/rules.d/80-fluffy-switch.rules"
	install -Dm 644 linux/fluffy.desktop "${pkgdir}/usr/share/applications/fluffy.desktop"
	install -Dm 644 icons/16x16/fluffy.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/fluffy.png"
	install -Dm 644 icons/24x24/fluffy.png "${pkgdir}/usr/share/icons/hicolor/24x24/apps/fluffy.png"
	install -Dm 644 icons/32x32/fluffy.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/fluffy.png"
	install -Dm 644 icons/48x48/fluffy.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/fluffy.png"
	install -Dm 644 icons/64x64/fluffy.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/fluffy.png"
	install -Dm 644 icons/128x128/fluffy.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/fluffy.png"
	install -Dm 755 fluffy.pyw "${pkgdir}/usr/bin/fluffy"
}
