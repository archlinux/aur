# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=colour-science
pkgname=python-${_base}
pkgdesc="Colour Science for Python"
pkgver=0.4.2
pkgrel=1
arch=('x86_64')
url="https://${_base}.org"
license=('custom:BSD-3-clause')
depends=(python-imageio python-scipy) # graphviz boost openexr libpng libtiff
makedepends=(python-setuptools)
# checkdepends=(python-pytest python-pygraphviz python-trimesh python-networkx python-scikit-learn)
optdepends=('python-matplotlib: for plot diagrams'
  'python-networkx: for create a graph with NetworkX'
  'python-pandas: for use dataframes'
  'python-pygraphviz: for plot automatic colour conversion graph using Graphviz'
  'python-tqdm: for compute hull section'
  'python-trimesh: for plot the section contour of given hull along given axis and origin')
source=(${_base//-science/}-${pkgver}.tar.gz::https://github.com/${_base}/${_base//-science/}/archive/v${pkgver}.tar.gz)
sha512sums=('952a7ced5528bc61f94889531e98ed9c66f3cb2d64a7b9269f844c414caef1565e6e4d921f358b70ddad5fe29492589ffd93ab8c8463114367c0ca58cba11854')

build() {
  cd ${_base//-science/}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base//-science/}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
