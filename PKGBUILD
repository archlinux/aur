pkgname=argon2-git
_gitname="phc-winner-argon2"
pkgdesc="The password hash Argon2, winner of PHC"
pkgver=20151206.r33.g2146480
pkgrel=1
arch=('i686' 'x86_64')
conflicts=("argon2")
provides=("argon2")
url="https://github.com/P-H-C/phc-winner-argon2"
license=('CC-0')
depends=('glibc')
makedepends=('git')
source=('git://github.com/P-H-C/phc-winner-argon2.git')
sha256sums=('SKIP')

pkgver() {
	cd $_gitname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_gitname
	make
	make test
}

package() {
	cd $_gitname
	install -D -m755 "${srcdir}/${_gitname}/argon2" "${pkgdir}/usr/bin/argon2"
	install -D -m755 "${srcdir}/${_gitname}/libargon2.so" "${pkgdir}/usr/lib/libargon2.so"
	install -D -m644 "${srcdir}/${_gitname}/src/argon2.h" "${pkgdir}/usr/include/argon2.h"
	ln -s "${pkgdir}/usr/lib/libargon2.so" "${pkgdir}/usr/lib/libargon2.so.0"
}
