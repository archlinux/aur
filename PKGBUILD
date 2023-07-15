# Maintainer: Médéric Boquien <mboquien@free.fr>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkg=shap
pkgname=python-${_pkg}
pkgver=0.42.1
pkgrel=1
pkgdesc="Game theoretic approach to explain the output of any machine learning model"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/slundberg/shap"
license=(MIT)
depends=(python python-numpy python-scipy python-scikit-learn python-pandas python-tqdm python-packaging python-slicer python-numba python-cloudpickle)
makedepends=(python-build python-installer python-wheel)
optdepends=(ipython python-matplotlib)
source=(https://files.pythonhosted.org/packages/source/s/${_pkg}/${_pkg}-${pkgver}.tar.gz)
sha512sums=('8646e84992a16c36555b5f7fc6969522c28ce155493fb12028cf401b3c7dca9e19156d2a15caa1ece7089f2c90039b40e31e0b5f9df008f9c241045fa9c7fad4')

build() {
  cd ${_pkg}-${pkgver}
  python -m build --wheel --no-isolation --skip-dependency-check
}

package(){
    cd "${_pkg}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D LICENSE "${pkgdir}/usr/share/licenses/python-${_pkg}/LICENSE"
}
