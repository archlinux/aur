# Maintainer: Eisuke Kawashima <e DOT kawaschima+arch AT gmail DOT com>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>

_name='basis_set_exchange'
pkgname="python-${_name}"
pkgver=0.12
pkgrel=1
pkgdesc='A repository for quantum chemistry basis sets'
arch=('any')
url='https://molssi-bse.github.io/basis_set_exchange/'
license=('BSD-3-Clause')
depends=(
  'python-argcomplete'
  'python-graphviz'
  'python-jsonschema'
  'python-numpy'
  'python-regex'
  'python-unidecode'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools-scm'
)
# to enable setuptools-scm to detection version
source=("git+https://github.com/MolSSI-BSE/${_name}.git#tag=v$pkgver")
sha256sums=(SKIP)

build() {
  cd "${srcdir}"/"${_name}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
