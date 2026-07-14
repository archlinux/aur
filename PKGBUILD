# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-pascal
pkgname=python-tree-sitter-pascal
pkgver=0.11.0
pkgrel=1
pkgdesc="Pascal grammar for tree-sitter"
arch=('any')
url="https://github.com/jimmckeeth/tree-sitter-pascal"
license=('AGPL-3.0-only')
depends=('python' 'python-tree-sitter')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('7d4da59b8c0b2ff9a32181562eed25c8ba13a6c8bbca2cb895e10f5344708dba')

build() {
  cd "${_name//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
