# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=simulavr-git
pkgver=r890.a12e85f
_pkgname=simulavr
pkgrel=1
pkgdesc="simulavr is a remote utility tool. (copy, paste and open browser) over TCP."
url="https://github.com/Traumflug/simulavr"
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=('go')
source=("${_pkgname}::git+https://github.com/Traumflug/simulavr.git"
		"gtest-flags.patch")
sha256sums=('SKIP'
            'a016162419acd85baff083d5380394da0add0b5b0297cc37ba3bddbb641b148c')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	patch -p1 -i "${srcdir}/gtest-flags.patch"
}

build() {
	cd "${srcdir}/${_pkgname}"

	./bootstrap
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var # --disable-doxygen-doc --enable-dependency-tracking
}

package() {
	cd "${srcdir}/${_pkgname}"

	make DESTDIR="$pkgdir" install
}
