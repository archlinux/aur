# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyfvm
pkgname=python-${_base}
pkgdesc="Finite volume discretization tools for Python"
pkgver=0.3.7
pkgrel=4
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-meshplex python-scipy python-sphinxcontrib-bibtex python-sympy)
makedepends=(python-setuptools)
# checkdepends=(python-pytest-codeblocks python-matplotlib python-pyamg python-pykry python-meshzoo) # python-netcdf4
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('51a13a18bfa73aa35bc5479aef7cf71c17080fa6c4575c707219baa465602534d6fc76d4a0204bb940fda4e7af6dae06ab5ad261300fcc92b19babc637d062df')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

# check() {
#   cd "${_base}-${pkgver}"
#   python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
#   MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks test
#   # PYTHONPATH="$PWD/build/lib/${_base}/" python -m pytest --codeblocks
# }

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
