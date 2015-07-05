pkgname=open-phd-guiding-svn
_svnname=open-phd-guiding
pkgver=658
pkgrel=1
pkgdesc="Linux port of PHD Guiding, autoguiding for telescopes"
url="http://code.google.com/p/open-phd-guiding/"
arch=('i686' 'x86_64')
license=('BSD3')
depends=('wxgtk' 'v4l-utils' 'zlib' 'cfitsio')
#optdepends=('')
makedepends=('cmake' 'subversion')
source=("${_svnname}::svn+http://open-phd-guiding.googlecode.com/svn/branches/openphd1")
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

