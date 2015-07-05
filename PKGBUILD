pkgname=astroavibrowser-svn
_svnname=astroavibrowser
pkgver=142
pkgrel=1
pkgdesc="A small tool for astronomy video sequences editing."
url="http://sourceforge.net/projects/astroavibrowser/"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('ffmpeg' 'qt4')
#optdepends=('sdl')
makedepends=('cmake' 'subversion')
provides=("${_svnname}")
conflicts=("${_svnname}")
source=("${_svnname}::svn://svn.code.sf.net/p/astroavibrowser/code/trunk")
sha1sums=('SKIP')

pkgver() {
	cd "$SRCDEST/${_svnname}"
	svnversion | tr -d [A-z]
}

build() {
	cd $_svnname
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make
}

package() {
	cd $_svnname
	make DESTDIR=$pkgdir install
}

