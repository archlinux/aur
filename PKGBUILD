# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=objopenssl-git
pkgver=r135.9b38780
pkgrel=1
pkgdesc='OpenSSL bindings for the ObjFW framework'
arch=(i686 x86_64)
url=https://objfw.nil.im/
license=(QPL GPL2 GPL3)
depends=(openssl objfw-git)
makedepends=(git clang)
conflicts=(objopenssl)
provides=(objopenssl)
source=(git+https://github.com/ObjFW/ObjOpenSSL.git)
md5sums=(SKIP)
_pkgname=ObjOpenSSL

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
