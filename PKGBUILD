# Maintainer: Médéric Boquien <mboquien@free.fr>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkg=shap
pkgname=python-${_pkg}
pkgver=0.47.0
pkgrel=1
pkgdesc="Game theoretic approach to explain the output of any machine learning model"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/slundberg/shap"
license=(MIT)
depends=(python python-numpy python-scipy python-scikit-learn python-pandas python-tqdm python-packaging python-slicer python-numba python-cloudpickle)
makedepends=(python-build python-installer python-wheel)
optdepends=(ipython python-matplotlib)
source=(https://files.pythonhosted.org/packages/source/s/${_pkg}/${_pkg}-${pkgver}.tar.gz)
sha512sums=('90ac3633756cd5998bee7fea8bd65d01401a3aca267c5fa81a89c34b45f20bdd5aaba33b847f3cfea46a82355ec59cf90cec483c7fd20f6f751ee6c2899ccb74')

build() {
  cd ${_pkg}-${pkgver}
  python -m build --wheel --no-isolation --skip-dependency-check
}

package(){
    cd "${_pkg}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D LICENSE "${pkgdir}/usr/share/licenses/python-${_pkg}/LICENSE"
}
