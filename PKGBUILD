# Maintainer Michael Fuchs <michfu@gmx.at>
pkgname=slangtng-git
pkgver=r157.cc4c140
pkgrel=1
pkgdesc="A toolkit for numerical analysis"
arch=('x86_64')
url="http://info.tuwien.ac.at/bucher/Private/slangTNG.html"
license=('BSD')
depends=()
makedepends=('git' 'gcc' 'gcc-fortran' 'qt5-base')
provides=('slangtng')
conflicts=('slangtng')
source=("$pkgname::git+git://git.tuxfamily.org/gitroot/slangtng2/slangtng.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	./prepare_thirdparty
	./compile_mac
}

package() {
	cd "$pkgname"
	mkdir -p $pkgdir/usr/bin
	cp ./build_mac/slangTNG/slangTNG/unix/lib/slangTNG $pkgdir/usr/bin/slangtng
}
