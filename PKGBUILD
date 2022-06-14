# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=colour-science
pkgname=python-${_base}
pkgdesc="Colour Science for Python"
pkgver=0.4.1
pkgrel=2
arch=('x86_64')
url="https://${_base}.org"
license=('custom:BSD-3-clause')
depends=(python-imageio python-scipy python-six) # graphviz boost openexr libpng libtiff
makedepends=(python-setuptools)
# checkdepends=(python-pytest python-pygraphviz python-trimesh python-networkx python-scikit-learn)
optdepends=('python-pygraphviz: for plot automatic colour conversion graph using Graphviz'
  'python-trimesh: for plot the section contour of given hull along given axis and origin'
  'python-networkx: for create a graph with NetworkX')
source=(https://github.com/${_base}/${_base//-science/}/archive/v${pkgver}.tar.gz)
sha512sums=('15679f75b65b219bd4e28e02832fb79098ecd79315119bfb2f15ad6277d256575bcac2dc57c6dbf8b09efe95c8b39cf7ccf16d392cbac3f15759bd0c4b64a25f')

build() {
  cd ${_base//-science/}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base//-science/}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
