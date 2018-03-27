# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname='ants'
pkgver=2.2.0
pkgrel=1
pkgdesc='Advanced Normalization Tools (ANTs) computes high-dimensional mappings to capture the statistics of brain structure and function'
arch=('i686' 'x86_64')
url='http://www.picsl.upenn.edu/ANTS/'
license=('Apache')
depends=('perl' 'insight-toolkit>=4.11.0')
makedepends=('git' 'cmake')
optdepends=()
provides=('ants')
conflicts=('ants-git')
source=("https://github.com/ANTsX/ANTs/archive/v${pkgver}.tar.gz")
sha256sums=('62f8f9ae141cb45025f4bb59277c053acf658d4a3ba868c9e0f609af72e66b4a')

prepare() {
	_builddir="${srcdir}/ANTs-${pkgver}/build"
	mkdir -p "$_builddir" || :

	cd "$_builddir"

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DANTS_SUPERBUILD=OFF \
		-DBUILD_SHARED_LIBS=ON \
		-DBUILD_TESTING=OFF \
		-DANTS_USE_QT=OFF \
		-DANTS_INSTALL_DEVELOPMENT=OFF \
		-DCOPY_SCRIPT_FILES_TO_BIN_DIR=OFF \
		-DANTS_BUILD_DISTRIBUTE=ON \
		-DBUILD_ALL_ANTS_APPS=ON \
		-DITK_USE_FFTWD=OFF \
		-DITK_USE_FFTWF=OFF \
		-DITK_USE_SYSTEM_FFTWF=OFF \
		-DRUN_LONG_TESTS=OFF \
		-DRUN_SHORT_TESTS=ON \
		-DUSE_VTK=OFF \
		..
}

build() {
	cd "$_builddir"
	make
}

package() {
	cd "${srcdir}/ANTs-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
}

