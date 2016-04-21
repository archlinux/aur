# Contributor: Penter ivaiva1999ivaiva@gmail.com
pkgname=cpr-git
_pkgname=cpr
_pkgauthor=whoshuu
pkgver=1.2
pkgrel=1
pkgdesc="C++ requests library by whoshuu"
arch=('i686' 'x86_64')
url="https://github.com/whoshuu/cpr"
license=('MIT')
depends=('curl')
makedepends=('git' 'cmake')
md5sums=('SKIP')
source+=("${_pkgname}-${pkgver}::git+https://github.com/${_pkgauthor}/${_pkgname}.git")

prepare (){
	cd "$srcdir/$_pkgname-$pkgver"
#	mkdir build && cd build
	cmake -DCPR_LIBRARY=/usr/lib CPR_INCLUDE_DIR=/usr/include -DINSECURE_CURL=ON -DBUILD_CPR_TESTS=OFF -DUSE_SYSTEM_CURL=ON .
	make
}

package(){
	cd "$srcdir/$_pkgname-$pkgver"
	mkdir "$pkgdir/usr"
	cp -R include "$pkgdir/usr"
	cp -R lib "$pkgdir/usr"
}
