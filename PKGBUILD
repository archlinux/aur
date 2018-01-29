
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
conflicts=('ospkit')
provides=('ospkit')
source=('git+http://gitlab.constantvzw.org/osp/tools.ospkit.git' 'ospkit.desktop' 'http://osp.kitchen/static/img/OSP_new-frog.svg')
md5sums=('SKIP' 'b921f154668105b891a8eac7e12ce94d' '49d812e67d58a48758ea3743ef6b6b5a')

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
	install -Dm755 "$srcdir/tools.ospkit/src/OSPKit" "$pkgdir/usr/bin/ospkit"
	install -Dm644 ospkit.desktop "$pkgdir/usr/share/applications/ospkit.desktop"
	install -Dm644 OSP_new-frog.svg "$pkgdir/usr/share/pixmaps/ospkit.svg"
}
