# Maintainer: monosans <hsyqixco at protonmail dot com>

pkgname=dwm-monosans-git
pkgver=6.2.r1717.ad5273f
pkgrel=1
pkgdesc='dwm with swallowing, systray, holdbar and other features'
url=https://github.com/monosans/dwm
arch=(i686 x86_64)
license=(MIT)
depends=(freetype2 libx11 libxinerama libxft)
optdepends=(
	'libxft-bgra: if dwm crashes when displaying emojis'
	'libxft-bgra-git: if dwm crashes when displaying emojis'
	'dmenu: program launcher'
	'st-monosans-git: default terminal emulator'
	'pcmanfm-gtk3: default file manager'
	'scrot: default screenshoter')
makedepends=(git)
source=(
	git://github.com/monosans/dwm
	config.mk)
sha256sums=(
	'SKIP'
	'961aa8a6202dd3c6625fcaf17280956fb5eb1048f5f82c37ee0f89f08c75028a')
provides=(dwm)
conflicts=(dwm)

pkgver() {
	cd dwm
	echo "$(awk '/^VERSION =/ {print $3}' config.mk)".r"$(git rev-list --count HEAD)"."$(git rev-parse --short HEAD)"
}

prepare() {
	cp config.mk dwm/
}

build() {
	cd dwm
	make
}

package() {
	cd dwm
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
