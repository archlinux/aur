# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-go
pkgname=python-tree-sitter-go
pkgver=0.25.0
pkgrel=12
_commit=1547678a9da59885853f5f5cc8a99cc203fa2e2c
pkgdesc="Go grammar for tree-sitter"
arch=('x86_64' 'aarch64')
url="https://github.com/tree-sitter/tree-sitter-go"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/tree-sitter/tree-sitter-go/archive/${_commit}.tar.gz")
sha256sums=('a71543d63f82b917457f47a3f6dbecd8087592fabc49a757da82c3e00c0e93de')

build() {
    cd "${_name}-${_commit}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${_commit}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
