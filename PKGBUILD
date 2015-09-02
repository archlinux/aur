# Maintainer: Charlie Grado

pkgname=nudoku-git
_gitname=nudoku
pkgver=0.2.4.r1.g633d5d2
pkgrel=1
pkgdesc="Sudoku for the terminal"
arch=('i686' 'x86_64')
url="https://jubalh.github.io/nudoku/"
license=('GPL3')
depends=('ncurses')
makedepends=('git')
provides=('nudoku')
conflicts=('nudoku')
source=("git+https://github.com/jubalh/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_gitname"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$_gitname"
	make install DESTDIR="$pkgdir"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
