# Maintainer: Timothée Ravier <tim@siosm.fr>

pkgname=c-rbtree-git
_pkgname=${pkgname/-git}
pkgver=r44.f8a088d
pkgrel=1
pkgdesc="Standalone Red-Black Tree Implementation in Standard ISO-C11"
arch=('i686' 'x86_64')
url="https://github.com/c-util/${_pkgname}"
license=('LGPL2.1')
makedepends=('git' 'meson')
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

prepare() {
	cd "${_pkgname}"
	rm -rf ./build
	mkdir build
}

build() {
	cd "${_pkgname}/build"
	meson --prefix=/usr --buildtype=plain ..
	ninja -v
}

check() {
	cd "${_pkgname}/build"
	ninja test
}

package() {
	cd "${_pkgname}/build"
	DESTDIR="${pkgdir}" ninja install
}
