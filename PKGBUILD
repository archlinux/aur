# Maintainer: Simon Ser
pkgname=libhangul-git
pkgver=0.1.0.r51.2ddc547f014a
pkgrel=2
pkgdesc="A library to support hangul input method logic"
arch=('x86_64')
url="https://github.com/libhangul/libhangul"
license=('LGPL')
depends=()
makedepends=('intltool' 'git')
provides=('libhangul')
conflicts=('libhangul')
source=("git+https://github.com/libhangul/libhangul.git")
md5sums=('SKIP')

pkgver() {
	cd libhangul
	printf "%s" "$(git describe --long | sed 's/libhangul-//' | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd libhangul
	touch config.rpath
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd libhangul
	make DESTDIR="$pkgdir/" install
	install -D COPYING "$pkgdir/usr/share/licenses/libhangul/COPYING"
}
