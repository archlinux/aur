# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-hcl
pkgname=python-tree-sitter-hcl
pkgver=1.2.0
pkgrel=1
pkgdesc="HCL and Terraform grammar for tree-sitter"
arch=('any')
url="https://github.com/tree-sitter-grammars/tree-sitter-hcl"
license=('Apache-2.0')
depends=('python' 'python-tree-sitter')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('f86cb7a9fd5cb93d83e2f788ae155544464c47755d09190505de562c0d6ad1dd')

build() {
  cd "${_name//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
