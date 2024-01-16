# Maintainer: Carson Rueter <swurl at swurl dot x y z>
# Contributor: Tyler Veness <calcmogul at gmail dot com>

pkgname=cscore
pkgver=2024.1.1
_pkgver="v2024.1.1"
pkgrel=1
pkgdesc="WPILib's CameraServer communication library"
arch=('x86_64')
url='https://github.com/wpilibsuite/allwpilib'
depends=('fmt' 'eigen')
makedepends=('cmake')
conflicts=('ntcore')
license=('BSD' 'MIT')
options=('!strip' 'staticlibs')
source=("git+https://github.com/wpilibsuite/allwpilib#tag=$_pkgver")
md5sums=('SKIP')

build() {
  cmake -B build -S "allwpilib" \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DUSE_SYSTEM_EIGEN=ON \
    -DUSE_SYSTEM_FMTLIB=ON \
    -DWITH_JAVA=OFF \
    -DWITH_CSCORE=ON \
    -DWITH_NTCORE=ON \
    -DWITH_WPIMATH=OFF \
    -DWITH_WPILIB=OFF \
    -DWITH_TESTS=ON \
    -DWITH_GUI=OFF \
    -DWITH_SIMULATION_MODULES=OFF \
    -DWITH_JAVA_SOURCE=OFF \
    -DNO_WERROR=ON \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
