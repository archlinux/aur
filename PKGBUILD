# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Roberto Hueso <roberto at robertohueso dot org>
# Contributor: jerry73204 <jerry73204@gmail.com>
# Contributor: Govind Gopakumar <govind.93 at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=mlpack
pkgver=4.3.0
pkgrel=1
pkgdesc="A fast, flexible, scalable C++ machine learning library"
arch=(x86_64)
url="https://${pkgname}.org"
license=('custom:BSD-3-clause')
depends=(armadillo cereal boost lapack ensmallen cython python-numpy python-pandas)
makedepends=(cmake txt2man python-setuptools python-wheel python-pytest-runner python-pip)
optdepends=('openmp: parallel computation support'
  'julia: julia bindings support'
  'r: r bindings support'
  'go: go bindings support')
source=(${url}/files/${pkgname}-${pkgver}.tar.gz)
sha512sums=('6b7c16190fa5106dde76cbedddc42ed0a4a97fcc606dc0b962744fdc812ac81f59a21b6cf071e3a8661c58cb9de2654a4eabd03c4f44d6091f99175887735c41')
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
