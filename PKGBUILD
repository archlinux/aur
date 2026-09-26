# Maintainer: sunnysab <i@sunnysab.cn>
pkgname=intel-igsc
pkgver=1.3.2
pkgrel=1
pkgdesc="Intel Graphics System Controller firmware update library"
arch=('x86_64')
url="https://github.com/intel/igsc"
license=('Apache-2.0')
depends=('glibc' 'intel-metee' 'systemd-libs')
makedepends=('cmake')
provides=("igsc=$pkgver" "libigsc.so=${pkgver%%.*}-64")
conflicts=('igsc')
source=("igsc-$pkgver.tar.gz::https://github.com/intel/igsc/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('4b0c443ad3ce5037e844d9d3837538dae87f00ceb4c57222c662eec290b0be73')

build() {
  cmake -B build -S "igsc-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_CLI=ON \
    -DENABLE_TESTS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
