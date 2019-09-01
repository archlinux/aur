# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=gammy-git
pkgver=0.9.42.r76.b4e14e0
pkgrel=1
pkgdesc="Automatic screen brightness tool."
arch=('x86_64')
url="https://getgammy.com"
license=('GPL3')
depends=('mesa' 'qt5-base')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Fushko/gammy.git'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'ad02735598429f55246969c58fe5ff54db7960e813996d6d642c08fb18687583')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake Gammy.pro
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install
	install -d "$pkgdir/usr/bin"
	ln -s /opt/gammy/bin/gammy "$pkgdir/usr/bin/gammy"
	install -Dm644 "$srcdir/${pkgname%-git}.desktop" \
		"$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
}
