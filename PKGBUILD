# Maintainer: Luca Weiss <WEI16416@spengergasse.at>

pkgname=blobby-volley-svn
pkgver=r1674
pkgrel=1
pkgdesc="Official continuation of the famous Blobby Volley 1.x arcade game."
arch=('x86_64' 'i686')
url="https://sourceforge.net/projects/blobby/"
makedepends=('svn')
depends=('boost' 'physfs')
license=('GPL2')
source=("blobby-code::svn+http://svn.code.sf.net/p/blobby/code/trunk" "blobby-volley.patch")
md5sums=('SKIP'
         '174c04c80eae5e43c75c0cd5e397cfc7')

pkgver() {
	cd blobby-code
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
	cd $srcdir/blobby-code/src
	patch -l -i $srcdir/blobby-volley.patch
}

build() {
	cd $srcdir/blobby-code
	cmake .
	make
}

package() {
	cd blobby-code
	make DESTDIR="$pkgdir/" install
}

