_base=ndim
pkgname=python-${_base}
pkgdesc="Compute multidimensional volumes and monomial integrals"
pkgver=0.1.5
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-sympy)
makedepends=(python-setuptools)
# checkdepends=(python-tox)
source=(https://files.pythonhosted.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('3b1765bf890631a678df69317148c3e0b179964dd49e59cb93f99564e7c36702de51383d9b33c6d30c778ec22917b63ab072788bb131e86778ec5af93b8a5b16')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

# check() {
#   cd "${_base}-${pkgver}"
#   tox -e py$(python -c "import sys; print(sys.version[:3].replace('.', ''))")
# }

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  python -c "from setuptools import setup; setup();" install --root="${pkgdir}" --optimize=1
  rm -r "${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")/${_base}/__pycache__"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
