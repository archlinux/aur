# Maintainer: Médéric Boquien <mboquien@free.fr>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkg=shap
pkgname=python-${_pkg}
pkgver=0.46.0
pkgrel=1
pkgdesc="Game theoretic approach to explain the output of any machine learning model"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/slundberg/shap"
license=(MIT)
depends=(python python-numpy python-scipy python-scikit-learn python-pandas python-tqdm python-packaging python-slicer python-numba python-cloudpickle)
makedepends=(python-build python-installer python-wheel)
optdepends=(ipython python-matplotlib)
source=(https://files.pythonhosted.org/packages/source/s/${_pkg}/${_pkg}-${pkgver}.tar.gz)
sha512sums=('ed4f0c8d308fd6acfcef56fbbbe6fbb5753ac4542681c4b3b0dda8058c6b042f38d305f9dbdd8ee4d766e53b8db9f600ebfdefbf5b2a499fac9280c0b98f091d')

build() {
  cd ${_pkg}-${pkgver}
  python -m build --wheel --no-isolation --skip-dependency-check
}

package(){
    cd "${_pkg}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D LICENSE "${pkgdir}/usr/share/licenses/python-${_pkg}/LICENSE"
}
