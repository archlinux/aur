# Contributor: Nathan Reiner <nathan.p.reiner@gmail.com>

#  pin last commit
_commit=cc55d3d7911a631a8d05fc403aa429b46964ce83

pkgname=libretextus
pkgver=0.1.r15.gcc55d3d
pkgrel=1
pkgdesc="Bible Accordance Application"
arch=('x86_64')
url="https://libretextus.github.io"
license=('CC0-1.0')
depends=('gtkmm3' 'boost-libs')
makedepends=('git' 'rapidxml' 'boost')
source=("$pkgname::git+https://github.com/LibreTextus/LibreTextus.git#commit=$_commit")
sha256sums=('b646be557f9101ee25b3ed382fc8f698fd8e74fa3792e0730003795a9e482035')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/usr/" install
	ln -sf /usr/share/LibreTextus/LibreTextus "$pkgdir/usr/bin"
}
