# Maintainer: Severin Leonhardt <serviushack at gmx dot de>
pkgname=xlivebg-git
pkgver=r180.23afaea
pkgrel=1
pkgdesc="Live wallpapers for the X window system"
arch=('x86_64')
url="http://nuclear.mutantstargoat.com/sw/xlivebg"
license=('GPL3')
depends=('glu'
         'libxrandr'
         'openmotif')
makedepends=("${depends[@]}" 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/jtsiomb/xlivebg.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure --prefix=/usr
	make -C libs
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install-all
}
