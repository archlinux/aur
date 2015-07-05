pkgname=qastrocam-g2-svn
_svnname=qastrocam-g2
pkgver=800
pkgrel=1
pkgdesc="Linux modified webcam capture software for astronomy."
url="http://sourceforge.net/projects/qastrocam-g2/"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('qt4' 'libjpeg-turbo' 'cfitsio' 'libusb')
optdepends=('sdl')
makedepends=('cmake' 'subversion')
provides=("${_svnname}")
conflicts=("${_svnname}")
source=("${_svnname}::svn://svn.code.sf.net/p/qastrocam-g2/svn/trunk")
sha1sums=('SKIP')

pkgver() {
	cd "$SRCDEST/${_svnname}"
	svnversion | tr -d [A-z]
}

build() {
	cd $_svnname
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make all
}

package() {
	cd $_svnname
	make DESTDIR="${pkgdir}" install
}

