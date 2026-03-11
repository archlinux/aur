# Maintainer: Eisuke Kawashima <e DOT kawaschima+arch AT gmail DOT com>
# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name='QCElemental'
_pkgname="${_name,,}"
pkgname="python-${_pkgname}"
pkgver=0.30.2
pkgrel=1
pkgdesc='Periodic table, physical constants, and molecule parsing for quantum chemistry'
arch=('any')
url='https://molssi.github.io/QCElemental/'
license=('BSD-3-Clause')
depends=(
  'python'
  'python-mpmath'
  'python-msgpack'
  'python-pint'
  'python-pydantic'
)
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel')
optdepends=(
  'ipython'
  'python-importlib-metadata'
  'python-jsonschema'
  'python-networkx'
  'python-numpy'
  'python-pytest'
  'python-scipy'
)
# checkdepends=('python-pytest')
source=("${_name}-${pkgver}.tar.gz::https://github.com/MolSSI/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4fffe72a3e3e7be7108602ba2eee3e6108e9932c04c42adcb831824f4f5b80ef')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

# importlib.metadata.PackageNotFoundError: No package metadata was found for qcelemental
# check() {
#   cd "${srcdir}/${_name}-${pkgver}"
#   python -m pytest -v
# }
