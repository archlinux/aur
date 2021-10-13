# Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=quadpy
pkgname=python-${_base}
pkgver=0.16.10
pkgrel=2
pkgdesc="Numerical integration (quadrature, cubature) in Python"
arch=('any')
url="https://github.com/nschloe/${_base}"
license=('GPL3')
depends=('python-orthopy' 'python-scipy' 'python-ndim')
makedepends=('python-setuptools')
# checkdepends=('python-pytest-codeblocks' 'python-accupy') # 'python-matplotlib' 'eigen' 'qt5-x11extras'
optdepends=('python-matplotlib: for Matplotlib rendering'
  'vtk: for generate polygon data for a sphere')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('258d87368078535d87992d5506539d736708527f106bc67fdb532dae052cb2cde4d96a725b6e15e2369a126e0fe1bc05ea8a1745ee3738f0f195d5617be88ae8')

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
