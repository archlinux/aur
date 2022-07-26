# Maintainer: Léo Chéneau <leocheneau+arch@gmail.com>

pkgname=easena-git
pkgver=r449.g33c1f75
pkgrel=4
pkgdesc="EAsy Specification of Evolutionary and Neural Algorithms is an Artificial Evolution platform developped by the SONIC (Stochastic Optimisation and Nature Inspired Computing) group of the BFO team at Université de Strasbourg. "
arch=(i686 x86_64)
url="http://easea.unistra.fr"
license=('AGPL3')
depends=(boost cmake flex bison valgrind)
makedepends=(make gcc)
provides=(easena easea)
conflicts=(easea)
replaces=(easea)
source=("git+https://github.com/EASEA/easea")
sha256sums=('SKIP')

#credits to tenacity PKGBUILD
pkgver() {
	cd easea
	printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd easea
	#patch --forward --strip=1 --input="${srcdir}/fix_config.patch"
	cmake -B build -DCMAKE_BUILD_TYPE=Release
}

build() {
	cd easea
	cmake --build build --config Release
}

package() {
	cd easea/build
	make DESTDIR="$pkgdir/" install
	#cmake --install build --prefix "$pkgdir"
}
