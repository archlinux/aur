# Maintainer: timasoft <tima.klester@gmail.com>
# Contributors: Youda008 and LtdJorge
pkgname=openrgb-cppsdk-git
pkgver=1.0.r0
pkgrel=1
pkgdesc="C++ client/SDK for OpenRGB"
url="https://github.com/Youda008/OpenRGB-cppSDK.git"
license=('MIT')
arch=('x86_64')

depends=('gcc-libs')
makedepends=('git' 'cmake' 'base-devel')
optdepends=('openrgb')
source=("git+${url}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/OpenRGB-cppSDK"
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/OpenRGB-cppSDK"
  mkdir -p build
  cd build
  cmake -B . -S .. \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build .
}

package() {
  cd "${srcdir}/OpenRGB-cppSDK/build"
  install -Dm644 liborgbsdk.a "${pkgdir}/usr/lib/liborgbsdk.a"
  install -d "${pkgdir}/usr/include/OpenRGB"
  install -Dm644 ../include/OpenRGB/* "${pkgdir}/usr/include/OpenRGB/"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${srcdir}/OpenRGB-cppSDK/protocol_description.txt" \
    "${pkgdir}/usr/share/doc/${pkgname}/protocol_description.txt"
}
