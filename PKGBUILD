# Maintainer: Tobias Backer Dirks <omgitsaheadcrab@gmail.com>

_pkgname=cpr
pkgname=$_pkgname-git
_pkgauthor=whoshuu
pkgver=1.5.1.r31.g9ee5777
pkgrel=1
pkgdesc="C++ requests library by whoshuu"
arch=('i686' 'x86_64')
url="https://github.com/whoshuu/cpr"
license=('MIT')
depends=('curl')
makedepends=('git' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare (){
	cd "$srcdir/$_pkgname"
	cmake -DCPR_LIBRARY=/usr/lib CPR_INCLUDE_DIR=/usr/include -DINSECURE_CURL=ON -DBUILD_CPR_TESTS=OFF -DUSE_SYSTEM_CURL=ON .
	make
}

package(){
	cd "$srcdir/$_pkgname"
	mkdir "$pkgdir/usr"
	cp -R include "$pkgdir/usr"
	cp -R lib "$pkgdir/usr"
}