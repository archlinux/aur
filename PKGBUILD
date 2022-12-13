# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>
# Maintainer: Mathieu Wespthal <mathieu.westphal+aur@gmail.com>

pkgname=f3d
pkgver=1.3.1
pkgrel=7
pkgdesc='A fast and minimalist 3D viewer'
arch=('x86_64')
url="https://github.com/${pkgname}-app/${pkgname}"
license=('BSD')
depends=('vtk' 'glew' 'pugixml' 'netcdf' 'ospray' 'assimp' 'opencascade' 'alembic' 'python' 'fmt')
makedepends=('cmake' 'help2man' 'openmp' 'pybind11')
source=("https://github.com/$pkgname-app/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('653dc4044e14d0618c1d947a8ee85d2513e100b3fc24bd6e51830131a13e795d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DF3D_INSTALL_DEFAULT_CONFIGURATION_FILE=ON \
        -DF3D_GENERATE_MAN=ON \
        -DF3D_INSTALL_MIME_TYPES_FILE=ON \
        -DF3D_INSTALL_THUMBNAILER_FILES=ON \
        -DF3D_PYTHON_BINDINGS=ON \
        -DF3D_INSTALL_SDK=ON \
        -DF3D_MODULE_OCCT=ON \
        -DF3D_MODULE_ASSIMP=ON \
        -DF3D_MODULE_ALEMBIC=ON \
        -DF3D_MODULE_RAYTRACING=ON \
        -DF3D_MODULE_EXTERNAL_RENDERING=ON \
        ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
