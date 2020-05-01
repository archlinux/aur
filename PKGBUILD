# Maintainer: Michael Armbruster <michael at armbrust dot me>

_pkgname=precomp
pkgname=${_pkgname}-git
_gitname=${_pkgname}-cpp
pkgver=0.4.6.r25.g30a2767
pkgrel=3
pkgdesc="Recompressor that further compresses already compressed files"
arch=('x86_64')
url="https://github.com/schnaader/precomp-cpp"
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/schnaader/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_gitname}"
	cmake -DCMAKE_BUILD_TYPE=Release -Bbuild -H. -G"Unix Makefiles"
	cd build
	make
}

package() {
	cd "${srcdir}/${_gitname}/build"
	mkdir -p "${pkgdir}/usr/bin"
	install -m 0755 precomp "${pkgdir}/usr/bin"
}
