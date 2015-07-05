pkgname=eos-movrec-svn
_svnname=eos-movrec
pkgver=133 
pkgrel=1
pkgdesc="Write short movies with your Canon EOS directly to computer using the live view mode."
url="http://sourceforge.net/projects/eos-movrec/"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('libgphoto2' 'qt4')
#optdepends=('')
makedepends=('cmake' 'gcc' 'subversion')
source=("${_svnname}::svn+https://eos-movrec.svn.sourceforge.net/svnroot/eos-movrec/trunk")
sha1sums=('SKIP')

pkgver() {
	cd "$SRCDEST/${_svnname}"
	svnversion | tr -d [A-z]
}

build() {
	cd $_svnname
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd $_svnname
	make DESTDIR="${pkgdir}" install
}

