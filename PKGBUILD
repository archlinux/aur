_base=ndim
pkgname=python-${_base}
pkgdesc="Compute multidimensional volumes and monomial integrals"
pkgver=0.1.5
pkgrel=2
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-sympy)
makedepends=(python-setuptools)
# checkdepends=(python-pytest-codeblocks)
source=(https://files.pythonhosted.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('3b1765bf890631a678df69317148c3e0b179964dd49e59cb93f99564e7c36702de51383d9b33c6d30c778ec22917b63ab072788bb131e86778ec5af93b8a5b16')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

# check() {
#   cd "${_base}-${pkgver}"
#   python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
#   PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks
# }

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --root="${pkgdir}" --optimize=1
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
