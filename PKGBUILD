pkgname=viper4linux-gui-git
pkgver=1.5.r0.6f13b51
pkgrel=1
pkgdesc="Unofficial UI for Viper4Linux"
arch=('any')
url="https://github.com/ThePBone/Viper4Linux-GUI"
license=('GPL3')
depends=('viper4linux' 'qt5-base')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/ThePBone/Viper4Linux-GUI.git"
		"viper4linux-gui.desktop"
		"viper4linux-gui.png")
sha256sums=('SKIP'
            '012e8b24684d876240b3fd6d62741b236cd41bfbcaaf9b41bbe9f8375ca7df71'
            '905e9201da348e26e84c0b973a8f91383b0bcab4d642c23be5f60e21c106e8ce')

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
	make INSTALL_ROOT="$pkgdir" install
	mv $pkgdir/usr/bin/V4L_Frontend $pkgdir/usr/bin/viper-gui
	install -Dm644 $srcdir/${pkgname%-git}.desktop $pkgdir/usr/share/applications/${pkgname%-git}.desktop
	install -Dm644 $srcdir/${pkgname%-git}.png $pkgdir/usr/share/pixmaps/${pkgname%-git}.png
}
