# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyfvm
pkgname=python-${_base}
pkgdesc="Finite volume discretization tools for Python"
pkgver=0.3.8
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-meshplex python-scipy python-sphinxcontrib-bibtex python-sympy)
makedepends=(python-setuptools)
# checkdepends=(python-pytest-codeblocks python-matplotlib python-pyamg python-pykry python-meshzoo) # python-netcdf4
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('de8ac9ed76aaaf0c8fcdcd45f8b3d4856dd9bd9a63246be26582c06039cb7a964b0e4a338c2d18d4781fc8a646d6dc2267f0dbd7966579c6dcde7b8f58a30385')

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
