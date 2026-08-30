# Maintainer: Eisuke Kawashima <e DOT kawaschima+archlinux AT gmail DOT com>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>

_name='QCElemental'
_pkgname="${_name,,}"
pkgname="python-${_pkgname}"
pkgver=0.51.1
pkgrel=1
pkgdesc='Periodic table, physical constants, and molecule parsing for quantum chemistry'
arch=('any')
url='https://molssi.github.io/QCElemental/'
license=('BSD-3-Clause')
depends=(
  'ipython'
  'python'
  'python-importlib-metadata'
  'python-mpmath'
  'python-msgpack'
  'python-networkx'
  'python-numpy'
  'python-pint'
  'python-pydantic'
  'python-scipy'
)
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm')
optdepends=(
  'python-jsonschema'
  'python-pytest'
)
checkdepends=('python-pytest')
source=("git+https://github.com/MolSSI/${_pkgname}.git#tag=v${pkgver}")
sha256sums=('d76057b8b1728c35994ff4e91da12ba162337411f43a978ff9e50fe946a671c6')

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --no-isolation
}

# importlib.metadata.PackageNotFoundError: No package metadata was found for qcelemental
check() {
  cd "${srcdir}/${_pkgname}"
  python -m pytest -v
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/${_pkgname}-${pkgver}-*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
