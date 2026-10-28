# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-powershell
pkgname=python-tree-sitter-powershell
pkgver=0.26.6
pkgrel=1
_commit=65ea6919e816a7ac142acec7ee72757f89db8439
pkgdesc="Powershell grammar for tree-sitter"
arch=('x86_64' 'aarch64')
url="https://github.com/airbus-cert/tree-sitter-powershell"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/airbus-cert/tree-sitter-powershell/archive/${_commit}.tar.gz")
sha256sums=('ce077de1a8537476750152afa984346a65519b7b795348cc8fb7f1e0e28e4a4a')

build() {
    cd "${_name}-${_commit}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${_commit}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
