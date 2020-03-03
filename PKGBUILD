# Maintainer: Christian Pfeiffer <cpfeiffer at live dot de>
pkgname=libigl
pkgver=2.1.0
pkgrel=1
pkgdesc="Simple C++ geometry processing library."
arch=('any')
url="https://github.com/libigl/libigl"
depends=('eigen')
makedepends=('cmake')
license=('GPL3')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('3e25bb5d7d6ba037d2afbb9b7ca5072216b8c68a6181b05be9adb56038e3f4abb73e8755d57984a2bef64a1df833f49246ac643dc7c39ff301d5b719b2eff278')

prepare() {
	mkdir build
}

build() {
	cd build
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
	cd build
	make DESTDIR="${pkgdir}" install
	# Install won't install all headers.
	cp -r ${srcdir}/${pkgname}-${pkgver}/include/igl ${pkgdir}/usr/include
}
