# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=jdsp4linux-gui-git
pkgver=0.1.r6.fa822cd
pkgrel=1
pkgdesc="User Interface for JamesDSP on Linux"
arch=('x86_64')
url="https://github.com/ThePBone/JDSP4Linux-GUI"
license=('GPL3')
depends=('jdsp4linux' 'qt5-multimedia' 'mesa')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ThePBone/JDSP4Linux-GUI.git'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'fa8ed0bee321c7fed6d2368d0bdf6fd12a3318e324bbda50ec6dbe7e3b784794')

pkgver() {
	cd "$srcdir/JDSP4Linux-GUI"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/JDSP4Linux-GUI"
	qmake
	make PREFIX=/usr
}

package() {
	cd "$srcdir/JDSP4Linux-GUI"
	install -Dm755 jdsp-gui "$pkgdir/usr/bin/jdsp-gui"
	install -Dm644 "$srcdir/${pkgname%-git}.desktop" \
		"$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
	install -Dm644 icons/icon.png \
		"$pkgdir/usr/share/pixmaps/jdsp-gui.png"
}
