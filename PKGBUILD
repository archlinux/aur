# Maintainer: James-Adam Renquinha Henri <jarhmander@gmail.com>
pkgname=guile-xosd-git
pkgver=v0.2.1.r3.8ece6bd
pkgrel=1
pkgdesc="Guile bindings for libxosd"
arch=('x86_64')
url="https://github.com/alezost/guile-xosd"
license=('GPL')
depends=('xosd')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/alezost/guile-xosd.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    ./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
