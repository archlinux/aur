# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>
# Maintainer: Mathieu Wespthal <mathieu.westphal+aur@gmail.com>

pkgname=f3d
pkgver=1.1.1
pkgrel=1
pkgdesc='A fast and minimalist 3D viewer'
arch=('x86_64')
url="https://github.com/${pkgname}-app/${pkgname}"
license=('BSD')
depends=('vtk' 'netcdf' 'ospray')
makedepends=('cmake')
source=("https://github.com/$pkgname-app/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('68bdbe3a90f2cd553d5e090a95d3c847e2a2f06abbe225ffecd47d3d29978b0a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF \
        -DF3D_INSTALL_DEFAULT_CONFIGURATION_FILE=ON \
        ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
