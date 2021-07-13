# Maintainer: Sasasu (i@sasa.su)
pkgname=azure-sdk-cpp-git
pkgver=1.0
pkgrel=1
pkgdesc='Azure SDK for C++'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/Azure/azure-sdk-for-cpp'
license=('MIT')
provides=('azure-sdk-cpp')
depends=(openssl curl)
makedepends=(cmake git)
source=("git+https://github.com/Azure/azure-sdk-for-cpp.git")
sha256sums=('SKIP')

build() {
  cd azure-sdk-for-cpp

  cmake \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    .
  cmake --build build
}

package() {
  cd azure-sdk-for-cpp

  cmake --build build --target install -- DESTDIR="$pkgdir"
}
