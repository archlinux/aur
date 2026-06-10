# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Roberto Hueso <roberto at robertohueso dot org>
# Contributor: jerry73204 <jerry73204@gmail.com>
# Contributor: Govind Gopakumar <govind.93 at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=mlpack
pkgver=4.8.0
pkgrel=1
pkgdesc="A fast, flexible, scalable C++ machine learning library"
arch=(x86_64)
url="https://${pkgname}.org"
license=(BSD-3-Clause)
depends=(armadillo cereal ensmallen lapack python-pandas)
makedepends=(cmake txt2man cython python-setuptools)
optdepends=('openmp: parallel computation support'
  'julia: julia bindings support'
  'r: r bindings support'
  'go: go bindings support')
source=(${url}/files/${pkgname}-${pkgver}.tar.gz)
sha512sums=('c5cfb92bbb51a2455039959029d648baca3b1ed1e660393bda2eb6e269dd8808ada47b1c736987d185eb3ee043f6fac1850e72d2c9489f57965e5db70bbc7895')
options=(!emptydirs)

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=17 \
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
