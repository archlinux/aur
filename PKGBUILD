# Maintainer: Christian Pfeiffer <cpfeiffer at live dot de>
pkgname=libigl
pkgver=2.3.0
_pkgtag=$pkgver
pkgrel=1
pkgdesc="Simple C++ geometry processing library."
arch=('any')
url="https://github.com/libigl/libigl"
depends=('eigen')
makedepends=('cmake')
license=('GPL3')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('41fbb3660e61457c3d6c52de4d17e0bfa56eb48eab82013c8095ce753c24ecff389365f91dbcf316cc422c09f713745251e32bddf4deff23fe5e428b9797da19')

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
