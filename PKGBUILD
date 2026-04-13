# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=zenoh-c
pkgver=1.9.0
pkgrel=1
pkgdesc="C API for Zenoh"
arch=('any')
url="https://zenoh.io/"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'ninja' 'rust')
source=("https://github.com/eclipse-zenoh/zenoh-c/archive/$pkgver.tar.gz")
sha256sums=('6d66b1d1c725700148a6ea90faf93aa99c72db71a348bf30f5838b5a1be192d9')

# Disable LTO: https://github.com/briansmith/ring/issues/1444
options=(!debug !lto)

build() {
  cmake -GNinja -B build -S "$pkgname-$pkgver" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DZENOHC_BUILD_WITH_UNSTABLE_API:BOOL=ON \
           -DZENOHC_BUILD_WITH_SHARED_MEMORY:BOOL=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
