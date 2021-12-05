# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>
# Maintainer: Mathieu Wespthal <mathieu.westphal+aur@gmail.com>

pkgname=f3d
pkgver=1.2.0
pkgrel=1
pkgdesc='A fast and minimalist 3D viewer'
arch=('x86_64')
url="https://github.com/${pkgname}-app/${pkgname}"
license=('BSD')
depends=('vtk' 'netcdf' 'ospray' 'assimp' 'opencascade')
makedepends=('cmake')
source=("https://github.com/$pkgname-app/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a4750217036a47ad26f5a2a77ec40e4b6415290bb55f6f931293ca24d975fa17')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF \
        -DF3D_INSTALL_DEFAULT_CONFIGURATION_FILE=ON \
        -DF3D_INSTALL_DEFAULT_CONFIGURATION_FILE_IN_PREFIX=ON \
        -DF3D_GENERATE_MAN=ON -DF3D_INSTALL_MIME_TYPES_FILE=ON \
        -DF3D_INSTALL_THUMBNAILER_FILES=ON \
        -DF3D_MODULE_OCCT=ON \
        -DF3D_MODULE_ASSIMP=ON \
        -DF3D_MODULE_RAYTRACING=ON \
        ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
