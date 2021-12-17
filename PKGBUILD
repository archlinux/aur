# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>
# Maintainer: Mathieu Wespthal <mathieu.westphal+aur@gmail.com>

pkgname=f3d
pkgver=1.2.1
pkgrel=2
pkgdesc='A fast and minimalist 3D viewer'
arch=('x86_64')
url="https://github.com/${pkgname}-app/${pkgname}"
license=('BSD')
depends=('vtk' 'glew' 'pugixml' 'netcdf' 'ospray' 'assimp' 'opencascade')
makedepends=('cmake' 'help2man' 'fmt')
source=("https://github.com/$pkgname-app/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0d72cc465af1adefdf71695481ceea95d4a94ee9e00125bc98c9f32b14ac2bf4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF \
        -DF3D_INSTALL_DEFAULT_CONFIGURATION_FILE=ON \
        -DF3D_GENERATE_MAN=ON \
        -DF3D_INSTALL_MIME_TYPES_FILE=ON \
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
