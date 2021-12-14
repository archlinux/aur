# Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=quadpy
pkgname=python-${_base}
pkgver=0.16.10
pkgrel=4
pkgdesc="Numerical integration (quadrature, cubature) in Python"
arch=('any')
url="https://github.com/nschloe/${_base}"
license=('GPL3')
depends=('python-orthopy' 'python-scipy' 'python-ndim')
makedepends=('python-setuptools')
# checkdepends=('python-pytest-codeblocks' 'python-accupy') # 'python-matplotlib' 'eigen' 'qt5-x11extras'
optdepends=('python-matplotlib: for Matplotlib rendering'
  'vtk: for generate polygon data for a sphere')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('badd0262e9d7cb12517357e5560c2f57ce2a643ca3cd9bab31464e7b238f373edc875cb902e62fc53220f0285fb8ad5b93c791a1a55b9c4876d09e27e4c9de5c')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

# check() {
#   cd "${_base}-${pkgver}"
#   python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
#   MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks
# }

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
