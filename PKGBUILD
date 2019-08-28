# Maintainer: Tobias Backer Dirks <omgitsaheadcrab@gmail.com>

pkgname=cpr-git
_pkgname="${pkgname%-git}"
_pkgauthor=whoshuu
pkgver=1.3
pkgrel=1
pkgdesc="C++ requests library by whoshuu"
arch=('i686' 'x86_64')
url="https://github.com/whoshuu/cpr"
license=('MIT')
depends=('curl')
makedepends=('git' 'cmake')
provides=("$_pkgname=${pkgver%%+*}")
conflicts=("$_pkgname")
source=("git+$url")
md5sums=('SKIP')

prepare (){
	cd "$srcdir/$_pkgname"
#	mkdir build && cd build
	cmake -DCPR_LIBRARY=/usr/lib CPR_INCLUDE_DIR=/usr/include -DINSECURE_CURL=ON -DBUILD_CPR_TESTS=OFF -DUSE_SYSTEM_CURL=ON .
	make
}

package(){
	cd "$srcdir/$_pkgname"
	mkdir "$pkgdir/usr"
	cp -R include "$pkgdir/usr"
	cp -R lib "$pkgdir/usr"
}