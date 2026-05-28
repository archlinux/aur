# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="h5df"
pkgname="${_pypiname}"
pkgver=0.1.5
pkgrel=1
pkgdesc="Library and CLI for storing numeric data frames in HDF5"
arch=(
  'any'
)
url="https://github.com/gilesc/${_pypiname}"
license=(
  'AGPL-3.0-or-later'
)
depends=(
  'python'
  'python-numpy'
  'python-pandas'
  'python-h5py'
  'python-click'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'

  'python-setuptools'
)
# checkdepends=(
#   'python-pytest'
# )
provides=(
  "python-${_pypiname}=${pkgver}"
)
conflicts=(
  "python-${_pypiname}"
)
_pkgsrc="${_pypiname//-/_}-${pkgver}"
source=(
  "pypi-${_pkgsrc}.tar.gz::https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname//-/_}/${_pkgsrc}.tar.gz"
)
sha256sums=('c1cbdc2723a1416abb0a58c69b6be4931b10c25f74962f6d5e48c149b8c08032')

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

  install -vDm644 "README.rst" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
