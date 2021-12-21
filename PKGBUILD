# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot top>
_base=meshplex
pkgname=python-${_base}
pkgdesc="Compute interesting points, areas, and volumes in simplex meshes of any dimension"
pkgver=0.16.7
pkgrel=3
arch=('any')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-meshio python-npx)
makedepends=(python-setuptools)
# checkdepends=(python-pytest-codeblocks python-meshzoo python-matplotlib python-scipy)
optdepends=('python-matplotlib: for Matplotlib rendering'
  'python-scipy: for analyze the connected components of a sparse graph'
  'vtk: for create polygonal sphere'
)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('ab59159aaa4e4cbb28fa201074a856c9fb1d637b6d29d126b052df27f79fec94a8086ed6b298b2ab9864b50298b3e12ca86daefccd27f2e13496b64091abcef0')

build() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  python -c "from setuptools import setup; setup();" build
}

# check() {
#   cd "${_base}-${pkgver}"
#   python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
#   MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks tests
# }

package() {
  cd "${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
