# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-php
pkgname=python-tree-sitter-php
pkgver=0.25.0
pkgrel=2
_commit=92b5271b60bec77fb65b5e5bc41561e8dac81299
pkgdesc="Php grammar for tree-sitter"
arch=('x86_64' 'aarch64')
url="https://github.com/tree-sitter/tree-sitter-php"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/tree-sitter/tree-sitter-php/archive/${_commit}.tar.gz")
sha256sums=('2dfa7643857b94a273b6b413b4cb694aef9c9898e17403f97b66a9ba9c163891')

build() {
    cd "${_name}-${_commit}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${_commit}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
