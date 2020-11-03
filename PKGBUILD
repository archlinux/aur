# Maintainer: Patrice Lacouture <archlinux@lacouture.org>
pkgname=gplanarity-svn
pkgver=r19257
pkgrel=1
pkgdesc="A simple puzzle game involving untangling planar graphs for fun and prizes"
arch=('i686' 'x86_64')
url="http://web.mit.edu/xiphmont/Public/gPlanarity.html"
license=('GPL2')
depends=('gtk2')
makedepends=('subversion')
conflicts=('gplanarity')
provides=('gplanarity')
source=('gplanarity.desktop'
        'svn+https://svn.xiph.org/trunk/planarity')
md5sums=('a0f7e34bc628ce25626a2b7afdb4fa8d'
         'SKIP')

pkgver() {
	cd "$srcdir/planarity"
	printf "r%s" "$(svnversion | tr -d 'A-z')"
}

prepare() {
	cd "$srcdir/planarity"
        ./touch-version
}

build() {
	cd "$srcdir/planarity"
	make PREFIX="$pkgdir/usr"
}

package() {
	desktop-file-install gplanarity.desktop --dir "$pkgdir"/usr/share/applications/

	cd "$srcdir/planarity"
	make PREFIX="$pkgdir/usr" install

	install -Dm644 gPicon.png "$pkgdir"/usr/share/pixmaps/gplanarity.png
}
