# Maintainer: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=stoken-git
pkgver=v0.92.r0.ddb5c7d
pkgrel=1
pkgdesc="RSA SecurID-compatible software token for Linux/UNIX systems"
arch=('i686' 'x86_64')
url="https://github.com/cernekee/${pkgname%-git}"
license=('LGPL2.1')
depends=('nettle' 'libxml2')
makedepends=('git')
optdepends=('gtk3: required for stoken-gui')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}"::"git+https://github.com/cernekee/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${pkgname%-git}"
	make -k check
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
