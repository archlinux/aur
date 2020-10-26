# Maintainer: Kian Kasad <kdkasad@gmail.com>

pkgname=dwm-kian-git
pkgver=v6.2.r30.4019b4b
pkgrel=2
pkgdesc="A customized version of dwm by Kian Kasad"
arch=('any')
url="https://git.kasad.com/dwm"
license=('MIT')
depends=('libx11' 'libxinerama' 'freetype2' 'yajl')
makedepends=('git')
optdepends=('libxft-bgra: for emojis in statusbar')
provides=('dwm')
conflicts=('dwm')
source=("${pkgname%-git}::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# print version using latest tag/commit
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make X11INC=/usr/include/X11/ X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/$pkgname/LICENSE"
}
