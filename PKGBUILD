# Maintainer: Timothée Ravier <tim@siosm.fr>

pkgname=c-rbtree-git
_pkgname=${pkgname/-git}
pkgver=r30.b5fcdd8
pkgrel=1
pkgdesc="Standalone Red-Black Tree Implementation in Standard ISO-C11"
arch=('i686' 'x86_64')
url="https://github.com/c-util/${_pkgname}"
license=('LGPL2.1')
makedepends=('git')
depends=('glibc')
provides=("${_pkgname}" "crbtree-git")
conflicts=("${_pkgname}" "crbtree-git")
replaces=("${_pkgname}" "crbtree-git")
source=("git+https://github.com/c-util/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
