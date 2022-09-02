# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=MicroStructPy
pkgname=python-${_base,,}
pkgdesc="Microstructure modeling, mesh generation, analysis, and visualization"
pkgver=1.5.6
pkgrel=1
arch=(x86_64)
url="https://github.com/kip-hart/${_base}"
license=(MIT)
depends=(python-aabbtree pybind11 python-lsq-ellipse python-matplotlib python-meshpy python-pygmsh python-pyquaternion python-pyvoro-mmalahe python-scipy python-xmltodict)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c3d09ed1a07371c656ddbff7a02a696b6d5b89069d9a81b5201dee880d01bfcf25f6df34a2ff149f726a2ee9aff5edde0de51f1023582303deeeaf895a885b88')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  PYTHONPATH="$PWD/build/lib:/usr/share/gmsh/api/python" python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
