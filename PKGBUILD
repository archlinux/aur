# $Id: PKGBUILD 252466 2015-12-05 16:35:01Z fyan $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=xbase
pkgver=3.3.2
pkgrel=3
pkgdesc="A C++ library"
arch=('i686' 'x86_64')
url='https://github.com/graywolf/xbase'
license=('LGPL')
depends=('gcc-libs')
makedepends=('git' 'cmake')
options=(staticlibs)

source=(
	"git+https://github.com/graywolf/xbase#tag=${pkgver}"
	"git+https://github.com/google/googletest"
)
sha512sums=(
	'SKIP'
	'SKIP'
)

prepare() {
	cd "${pkgname}"

	git submodule init
	git config submodule.3rd_party/googletest.url "${srcdir}/googletest"
	git submodule update

	mkdir -p build
}

build() {
	cd "${pkgname}/build"

	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="${pkgdir}" \
		..
	make
}

check() {
	./xbase/build/test/tests
}

package() {
	cd "${pkgname}/build"
	make install
	rm -r /build/xbase/pkg/xbase/lib64
}
