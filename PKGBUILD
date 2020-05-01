# Maintainer: Michael Armbruster <michael at armbrust dot me>

pkgname=precomp
_gitname=${pkgname}-cpp
pkgver=0.4.7
pkgrel=3
pkgdesc="Recompressor that further compresses already compressed files"
arch=('x86_64')
url="https://github.com/schnaader/precomp-cpp"
license=('Apache')
makedepends=('cmake')
depends=('gcc-libs')
source=("https://github.com/schnaader/${_gitname}/archive/v${pkgver}.tar.gz")
sha256sums=('b4064f9a18b9885e574c274f93d73d8a4e7f2bbd9e959beaa773f2e61292fb2b')

build() {
	cd "${_gitname}-${pkgver}"
	cmake -DCMAKE_BUILD_TYPE=Release -Bbuild -H. -G"Unix Makefiles"
	cd build
	make
}

package() {
	cd "${_gitname}-${pkgver}/build"
	mkdir -p "${pkgdir}/usr/bin"
	install -m 0755 precomp "${pkgdir}/usr/bin"
}
