pkgname=libzipper-git
pkgver=1.0.1
pkgrel=1
pkgdesc="C++ wrapper around minizip compression library"
license=(MIT)
arch=('i686' 'x86_64')
url='https://github.com/sebastiandev/zipper'
depends=(zlib)
source=("git://github.com/sebastiandev/zipper.git")
md5sums=('SKIP')

build() {
	cd "${srcdir}/zipper"
	git submodule update --init --recursive
	mkdir -p build
	cd build
	cmake -DBUILD_SHARED_VERSION=on ..
	make -j
}

package() {
	cd "${srcdir}/zipper"

	libdir="${pkgdir}/usr/lib/"
	includedir="${pkgdir}/usr/include/"

	mkdir -p "${libdir}"
	mkdir -p "${includedir}"

	cp build/libZipper.so* "${libdir}"
	cp -r zipper "${includedir}"
	rm "${includedir}"/zipper/*.vcxproj*
}

