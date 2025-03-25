# Maintainer: Médéric Boquien <mboquien@free.fr>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkg=shap
pkgname=python-${_pkg}
pkgver=0.47.1
pkgrel=1
pkgdesc="Game theoretic approach to explain the output of any machine learning model"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/slundberg/shap"
license=(MIT)
depends=(python python-numpy python-scipy python-scikit-learn python-pandas python-tqdm python-packaging python-slicer python-numba python-cloudpickle)
makedepends=(python-build python-installer python-wheel)
optdepends=(ipython python-matplotlib)
source=(https://files.pythonhosted.org/packages/source/s/${_pkg}/${_pkg}-${pkgver}.tar.gz)
sha512sums=('c526ebe96ad13693d380fd736492fafc54a42297c576a7a7a1b6afdd04b175cbbb082ceac6bf024c9450fbb201fbfc3bde71aef7c86276de972357fafd1d4ee4')

build() {
  cd ${_pkg}-${pkgver}
  python -m build --wheel --no-isolation --skip-dependency-check
}

package(){
    cd "${_pkg}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D LICENSE "${pkgdir}/usr/share/licenses/python-${_pkg}/LICENSE"
}
