# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>

pkgname=f3d
pkgver=1.1.0
pkgrel=1
pkgdesc='A fast and minimalist 3D viewer'
arch=('x86_64')
url="https://gitlab.kitware.com/${pkgname}/${pkgname}"
license=('BSD')
depends=('vtk9')
makedepends=('cmake')
source=("https://gitlab.kitware.com/$pkgname/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('93aa9759efcc4e77beac4568280aaeaca21bfb233d3c9f60262207ca595bde79')

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF \
        -DF3D_INSTALL_DEFAULT_CONFIGURATION_FILE=ON \
        ..
  # Add "-j$(($(nproc) + 1))" here or to your makeflags to enable parallel builds.
  make
}

package() {
  cd "$srcdir/$pkgname-v$pkgver/build"
  make DESTDIR="$pkgdir" install
}

