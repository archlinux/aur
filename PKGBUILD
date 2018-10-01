# Maintainer: jerry73204 <jerry73204@gmail.com>
# Former Maintainer: Govind Gopakumar < govind.93 at gmail dot com>
# Former Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=mlpack
pkgver=3.0.3
pkgrel=1
pkgdesc='a scalable c++ machine learning library'
arch=('i686' 'x86_64')
url="http://www.mlpack.org"
license=('BSD')
depends=(
  'armadillo>=6.500.0'
  'boost>=1.49'
  'lapack'
  'libxml2>=2.6.0'
  'cython>=0.24'
  'python-numpy'
  'python-pandas>=0.15.0'
)
makedepends=(
  'cmake>=2.8.5'
  'txt2man'
  'python-setuptools'
  'python-pytest-runner'
)
source=("http://www.mlpack.org/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b6128e7eb700c69873c3cd5c3a78c79e9f5b7d92bc8d962670733c677d905d90')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake \
      -D CMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
      -D BUILD_PYTHON_BINDINGS=ON \
      .
  make
}

check() {
  # Comment out check() if there are failed tests. If you consider it a bug,
  # please file an issue on upstream instead of AUR.

  cd "${srcdir}/${pkgname}-${pkgver}"

  make mlpack_test
  bin/mlpack_test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install

  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"

  rm -rf ${pkgdir}/usr/lib/python3.6/site-packages/{site.py,__pycache__,easy-install.pth}
}
