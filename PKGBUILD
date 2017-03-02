# Maintainer: Balazs Nemeth <b2nemeth@gmail.com>
pkgname=trng4-git
pkgver=r24.5e130e9
pkgrel=1
pkgdesc="State of the art C++ pseudo-random number generator library for sequential and parallel Monte Carlo simulations"
arch=('x86_64')
url="https://www.numbercrunch.de/trng/"
source=("git+https://github.com/rabauke/trng4.git")
md5sums=('SKIP')
_gitname="trng4"

prepare() {
	cd "$_gitname"
	autoreconf -fvi
	automake
}

pkgver() {
	cd "$_gitname"
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_gitname"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_gitname"
	make DESTDIR="$pkgdir/" install
}
