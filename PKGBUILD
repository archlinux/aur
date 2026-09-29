# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-elixir
pkgname=python-tree-sitter-elixir
pkgver=0.3.5
pkgrel=10
_commit=e2d9e6e0e76b0c436fa48a0b8c32a031d0cbdf49
pkgdesc="Elixir grammar for tree-sitter"
arch=('x86_64' 'aarch64')
url="https://github.com/elixir-lang/tree-sitter-elixir"
license=('Apache-2.0')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/elixir-lang/tree-sitter-elixir/archive/${_commit}.tar.gz")
sha256sums=('52dff618dfaea912e4b5757035ad723a18cc361cdcb92349d63fa94517f118c5')

build() {
    cd "${_name}-${_commit}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${_commit}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
