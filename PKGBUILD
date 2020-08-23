# Maintainer: spider-mario <spidermario@free.fr>
pkgname=xvc-git
pkgver=v1.0.r7.3e1db91
pkgrel=1
pkgdesc="Modern software-defined video compression format"
arch=('x86_64')
url="https://xvc.io/"
license=('LGPL2.1')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/divideon/xvc.git')
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir"/xvc
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr "$srcdir"/xvc
	make
}

check() {
	cd build
	make test
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
}
