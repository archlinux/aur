
# Maintainer: Bachir Soussi Chiadmi (scbh at g-u-i dot me)
pkgname=ospkit-git
pkgver=r32.7f46ee9
pkgrel=1
pkgdesc="Webkit based html browser for printing."
arch=('i686' 'x86_64')
url="http://osp.kitchen/tools/ospkit/"
license=('AGPL')
depends=('desktop-file-utils' 'qt5-webkit')
makedepends=('git')
provides=('ospkit')
source=('git+http://gitlab.constantvzw.org/osp/tools.ospkit.git' 'ospkit.desktop' 'ospkit.png')
md5sums=('SKIP' 'b921f154668105b891a8eac7e12ce94d' '908a48e767b3286fa6e9a1d8b571ef65')
conflicts=("")

pkgver() {
	cd "$srcdir/tools.ospkit"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/tools.ospkit/src/"
	qmake prefix=/usr
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install "$srcdir/tools.ospkit/src/OSPKit" "$pkgdir/usr/bin/ospkit"
	mkdir -p "$pkgdir/usr/share/applications"
	install -Dm644 ospkit.desktop "$pkgdir/usr/share/applications/ospkit.desktop"
	mkdir -p "$pkgdir/usr/share/pixmaps"
	install -Dm644 ospkit.png "$pkgdir/usr/share/pixmaps/ospkit.png"
}
