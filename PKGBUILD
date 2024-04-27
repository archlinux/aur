# Maintainer: Médéric Boquien <mboquien@free.fr>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkg=shap
pkgname=python-${_pkg}
pkgver=0.45.0
pkgrel=1
pkgdesc="Game theoretic approach to explain the output of any machine learning model"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/slundberg/shap"
license=(MIT)
depends=(python python-numpy python-scipy python-scikit-learn python-pandas python-tqdm python-packaging python-slicer python-numba python-cloudpickle)
makedepends=(python-build python-installer python-wheel)
optdepends=(ipython python-matplotlib)
source=(https://files.pythonhosted.org/packages/source/s/${_pkg}/${_pkg}-${pkgver}.tar.gz)
sha512sums=('61e06bc204f71c500f108ce52de969c0ac4491fd468b37fd3247cc74330c9bd81f9aeed3a0ae607bc884fcc6c6c5570a648621a79c5e7d6478899e1b228fb8af')

build() {
  cd ${_pkg}-${pkgver}
  python -m build --wheel --no-isolation --skip-dependency-check
}

package(){
    cd "${_pkg}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D LICENSE "${pkgdir}/usr/share/licenses/python-${_pkg}/LICENSE"
}
