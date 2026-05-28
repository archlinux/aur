# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="metaarray"
pkgname="python-${_pypiname}"
pkgver=2.2.2
pkgrel=1
pkgdesc="N-dimensional array with metadata such as axis titles, units, and column names"
arch=(
  'any'
)
url="https://github.com/outofculture/${_pypiname}"
license=(
  'MIT'
)
depends=(
  'python>=3.7'
  'python-numpy'
  # 'python-h5df'

  'python-h5py'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'

  'python-setuptools>=61.0'
)
# checkdepends=(
#   'python-pytest>=7.0'
#   'python-pytest-qt>=4.0'
# )
optdepends=(
  'python-pyqtgraph>=0.11.0: plotting'
)
_pkgsrc="${_pypiname//-/_}-${pkgver}"
source=(
  "pypi-${_pkgsrc}.tar.gz::https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname//-/_}/${_pkgsrc}.tar.gz"
)
sha256sums=('4674feb2cad719d7692330676647b3e971ab7fffec3fa7ec5520eb9b5b4edaa3')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   pytest
# }

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
