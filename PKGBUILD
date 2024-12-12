# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Roberto Hueso <roberto at robertohueso dot org>
# Contributor: jerry73204 <jerry73204@gmail.com>
# Contributor: Govind Gopakumar <govind.93 at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=mlpack
pkgver=4.5.1
pkgrel=1
pkgdesc="A fast, flexible, scalable C++ machine learning library"
arch=(x86_64)
url="https://${pkgname}.org"
license=(BSD-3-Clause)
depends=(armadillo cereal boost lapack ensmallen cython python-numpy python-pandas)
makedepends=(cmake txt2man python-setuptools python-wheel python-pytest-runner python-pip)
optdepends=('openmp: parallel computation support'
  'julia: julia bindings support'
  'r: r bindings support'
  'go: go bindings support')
source=(${url}/files/${pkgname}-${pkgver}.tar.gz)
sha512sums=('2be9c3b8e2874ebbf9e39ade1d65774e1d7d08eea1427d592ef9f49f6a35a1441585749e043e058cbcb8f5e7eae4cf589b0f4931c59ae6c0fed74c32bac0f4b3')
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
