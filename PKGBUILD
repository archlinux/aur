# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname="jstrings"
pkgdesc="A tool for finding JIS-based Japanese characters in binary data"

pkgver=1.6
pkgrel=3

arch=(aarch64 i686 x86_64)

url="https://github.com/drojaazu/${pkgname}"
license=(MIT)

depends=(libiconv)
makedepends=(cmake)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=(ec9af20bb90f8227e6722c049b072d25)

prepare() {
	# move into the source directory
	cd "${pkgname}-${pkgver}"

	# create a build directory
	mkdir -p build && cd build

	# generate a Makefile
	cmake ..
}

build() {
	# move into the build directory
	cd "${pkgname}-${pkgver}/build"

	# build the project
	make
}

package() {
	# move into the source directory
	cd "${pkgname}-${pkgver}"

	# copy the main executable and the license
	install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}