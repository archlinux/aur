# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-lua
pkgname=python-tree-sitter-lua
pkgver=0.5.0
pkgrel=12
_commit=10fe0054734eec83049514ea2e718b2a56acd0c9
pkgdesc="Lua grammar for tree-sitter"
arch=('x86_64' 'aarch64')
url="https://github.com/tree-sitter-grammars/tree-sitter-lua"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-lua/archive/${_commit}.tar.gz")
sha256sums=('82c3ca5808de02addd9c7fb5275d89260c6557019aa6e40ca52c0595bf1d33cd')

build() {
    cd "${_name}-${_commit}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${_commit}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
