# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=viper4linux-gui-git
pkgver=1.11.r0.6c68d10
pkgrel=1
pkgdesc="Official UI for Viper4Linux"
arch=('any')
url="https://github.com/ThePBone/Viper4Linux-GUI"
license=('GPL3')
depends=('viper4linux' 'qt5-base' 'mesa')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/ThePBone/Viper4Linux-GUI.git"
		"viper4linux-gui.desktop")
sha256sums=('SKIP'
            '05a46b8ad3508e9275388d9255247cda09977eb8087fa5dd96d04bc25c17a77c')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake
	make PREFIX=/usr
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 V4L_Frontend $pkgdir/usr/bin/viper-gui
	install -Dm644 $srcdir/${pkgname%-git}.desktop $pkgdir/usr/share/applications/${pkgname%-git}.desktop
	install -Dm644 viper.png $pkgdir/usr/share/pixmaps/${pkgname%-git}.png
}
