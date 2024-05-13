# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname="jstrings"
pkgdesc="A tool for finding JIS-based Japanese characters in binary data"

pkgver=1.6
pkgrel=1

arch=(x86_64 i386)

url="https://github.com/drojaazu/jstrings"
license=("MIT")

depends=(libiconv)
makedepends=(cmake)

provides=(jstrings)

source=("https://github.com/drojaazu/jstrings/archive/refs/tags/${pkgver}.tar.gz")
md5sums=("SKIP")

prepare() {
	# move into the source directory
	cd "jstrings-${pkgver}"

	# create a build directory
	mkdir -p build && cd build

	# generate a Makefile
	cmake ..
}

build() {
	# move into the build directory
	cd "jstrings-${pkgver}/build"

	# build the project
	make
}

package() {
	# move into the source directory
	cd "jstrings-${pkgver}"

	# copy the main executable and the license
	install -Dm755 build/jstrings "${pkgdir}/usr/bin/jstrings"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}