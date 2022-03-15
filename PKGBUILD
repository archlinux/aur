# Maintainer: Christian Pfeiffer <cpfeiffer at live dot de>
pkgname=libigl
pkgver=2.4.0
_pkgtag=$pkgver
pkgrel=2
pkgdesc="Simple C++ geometry processing library."
arch=('any')
url="https://github.com/libigl/libigl"
depends=('eigen')
makedepends=('cmake')
license=('GPL3')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('f9e19c6d9a7fa2afe12c0a4042c3cc46606413d7f79b20e2464021fc0c5d9730e0ab2c192e5b4f161f3bc3a42a654929a2e77baac44c3eddad486f709cf909a1')

prepare() {
	mkdir -p "$srcdir/build-$_pkgtag"
}

build() {
	cd "$srcdir/build-$_pkgtag"
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-DLIBIGL_BUILD_TESTS=OFF \
		-DLIBIGL_BUILD_TUTORIALS=OFF \
		-DLIBIGL_USE_STATIC_LIBRARY=OFF \
		-DLIBIGL_COPYLEFT_CGAL=OFF \
		-DLIBIGL_COPYLEFT_COMISO=OFF \
		-DLIBIGL_EMBREE=OFF \
		-DLIBIGL_RESTRICTED_MATLAB=OFF \
		-DLIBIGL_RESTRICTED_MOSEK=OFF \
		-DLIBIGL_OPENGL=OFF \
		-DLIBIGL_GLFW=OFF \
		-DLIBIGL_IMGUI=OFF \
		-DLIBIGL_PNG=OFF \
		-DLIBIGL_PREDICATES=OFF \
		-DLIBIGL_COPYLEFT_TETGEN=OFF \
		-DLIBIGL_RESTRICTED_TRIANGLE=OFF \
		-DLIBIGL_XML=OFF \
		-DFETCHCONTENT_SOURCE_DIR_EIGEN=/usr/include/eigen3 \
		-DFETCHCONTENT_UPDATES_DISCONNECTED=ON \
		"${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "$srcdir/build-$_pkgtag"
	make DESTDIR="${pkgdir}" install

	# do not install Eigen
	echo "remove Eigen from package"
	rm -r "${pkgdir}/usr/lib/cmake/eigen" "${pkgdir}/usr/include/Eigen"
}
