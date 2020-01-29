# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=viper4linux-gui-git
pkgver=r206.63ab11c
pkgrel=1
epoch=2
pkgdesc="Official UI for Viper4Linux"
arch=('any')
url="https://github.com/Audio4Linux/Viper4Linux-GUI"
license=('GPL3')
depends=('viper4linux' 'qt5-base' 'qt5-multimedia' 'mesa')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/Audio4Linux/Viper4Linux-GUI.git"
		"${pkgname%-git}.desktop")
sha256sums=('SKIP'
            '05a46b8ad3508e9275388d9255247cda09977eb8087fa5dd96d04bc25c17a77c')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake
	make PREFIX=/usr
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 V4L_Frontend "$pkgdir/usr/bin/viper-gui"
	install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 viper.png "$pkgdir/usr/share/pixmaps/viper-gui.png"
}
