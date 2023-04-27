# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Roberto Hueso <roberto at robertohueso dot org>
# Contributor: jerry73204 <jerry73204@gmail.com>
# Contributor: Govind Gopakumar <govind.93 at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=mlpack
pkgver=4.1.0
pkgrel=1
pkgdesc="A fast, flexible, scalable C++ machine learning library"
arch=(x86_64)
url="https://${pkgname}.org"
license=('custom:BSD-3-clause')
depends=(armadillo cereal boost lapack ensmallen cython python-numpy python-pandas)
makedepends=(cmake txt2man python-setuptools python-pytest-runner) # python-wheel
optdepends=('openmp: parallel computation support'
  'julia: julia bindings support'
  'r: r bindings support'
  'go: go bindings support')
source=(${url}/files/${pkgname}-${pkgver}.tar.gz)
sha512sums=('0cab346f81b04a298f09ba28cec679c275af80c3941f31977ba5d0cfe11eed5850190ce46e71cf003996391618ad4eac2e0a54e260d264b8f8f9a02f53ec7cc7')
options=(!emptydirs)

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=14 \
    -DBUILD_CLI_EXECUTABLES=ON \
    -DBUILD_PYTHON_BINDINGS=ON \
    -DBUILD_TESTS=OFF \
    -DUSE_OPENMP=ON
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
