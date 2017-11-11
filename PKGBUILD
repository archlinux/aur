# Maintainer Michael Fuchs <michfu@gmx.at>
pkgname=slangtng-git
pkgver=r157.cc4c140
pkgrel=2
pkgdesc="A toolkit for numerical analysis"
arch=('x86_64')
url="http://info.tuwien.ac.at/bucher/Private/slangTNG.html"
license=('BSD')
depends=()
makedepends=('git' 'gcc' 'gcc-fortran' 'qt5-base')
provides=('slangtng')
conflicts=('slangtng')
source=("$pkgname::git+git://git.tuxfamily.org/gitroot/slangtng2/slangtng.git"
"http://info.tuwien.ac.at/bucher/Private/slangTNG_files/samples.zip")
md5sums=('SKIP'
'0b43b36b0c10a791a9a9d233b3e94024')

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
	install -Dm755 ./build_mac/slangTNG/slangTNG/unix/lib/slangTNG $pkgdir/usr/bin/slangtng
	install -dm755 $pkgdir/usr/share/doc/slangtng/samples
	install -Dm644 ../samples/* $pkgdir/usr/share/doc/slangtng/samples
}
