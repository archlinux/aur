# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-elixir
pkgname=python-tree-sitter-elixir
pkgver=0.3.5
pkgrel=8
pkgdesc="Elixir grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/elixir-lang/tree-sitter-elixir"
license=('Apache-2.0')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/elixir-lang/tree-sitter-elixir/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7d8bf37949e2bea75a19d38491d7680ed1c9f0f5a41a5235832d718ec174c7c4')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
