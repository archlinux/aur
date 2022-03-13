# Maintainer: Christian Pfeiffer <cpfeiffer at live dot de>
pkgname=libigl
pkgver=2.4.0
_pkgtag=$pkgver
pkgrel=1
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
		-DLIBIGL_BUILD_PYTHON=OFF \
		-DLIBIGL_BUILD_TESTS=OFF \
		-DLIBIGL_BUILD_TUTORIALS=OFF \
		-DLIBIGL_SKIP_DOWNLOAD=ON \
		-DLIBIGL_USE_STATIC_LIBRARY=OFF \
		-DLIBIGL_WITH_CGAL=OFF \
		-DLIBIGL_WITH_COMISO=OFF \
		-DLIBIGL_WITH_EMBREE=OFF \
		-DLIBIGL_WITH_MATLAB=OFF \
		-DLIBIGL_WITH_MOSEK=OFF \
		-DLIBIGL_WITH_OPENGL=OFF \
		-DLIBIGL_WITH_OPENGL_GLFW=OFF \
		-DLIBIGL_WITH_OPENGL_GLFW_IMGUI=OFF \
		-DLIBIGL_WITH_PNG=OFF \
		-DLIBIGL_WITH_PREDICATES=OFF \
		-DLIBIGL_WITH_PYTHON=OFF \
		-DLIBIGL_WITH_TETGEN=OFF \
		-DLIBIGL_WITH_TRIANGLE=OFF \
		-DLIBIGL_WITH_XML=OFF \
		"${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "$srcdir/build-$_pkgtag"
	make DESTDIR="${pkgdir}" install
	# Install won't install all headers.
	cp -r ${srcdir}/${pkgname}-${pkgver}/include/igl ${pkgdir}/usr/include
}
