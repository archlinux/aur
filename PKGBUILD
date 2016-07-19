# Maintainer: Luca Weiss <WEI16416@spengergasse.at>

pkgname=blobby-volley-svn
pkgver=r1678
pkgrel=1
pkgdesc="Official continuation of the famous Blobby Volley 1.x arcade game."
arch=('x86_64' 'i686')
url="https://sourceforge.net/projects/blobby/"
makedepends=('subversion' 'boost' 'cmake' 'zip')
depends=('physfs' 'sdl2')
license=('GPL2')
source=("blobby-code::svn+http://svn.code.sf.net/p/blobby/code/trunk")
md5sums=('SKIP')

pkgver() {
	cd blobby-code
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
	cd $srcdir/blobby-code
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd blobby-code
	make DESTDIR="$pkgdir/" install
}

