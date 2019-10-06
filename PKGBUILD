# Maintainer: James-Adam Renquinha Henri <jarhmander@gmail.com>
pkgname=guile-daemon-git
pkgver=v0.1.2.r0.006e46f
pkgrel=1
pkgdesc="Evaluate code in a running Guile process"
arch=('x86_64')
url="https://github.com/alezost/guile-daemon"
license=('GPL')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/alezost/guile-daemon.git')
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
