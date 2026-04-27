# Maintainer: Your Name <your.email@example.com>

_name=tree-sitter-elixir
pkgname=python-tree-sitter-elixir
pkgver=0.3.5
pkgrel=1
pkgdesc="Elixir grammar for tree-sitter"
arch=('any')
url="https://pypi.org/project/tree-sitter-elixir/"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/e8/83/0501ee426bcd40cf5f765ce66ff2e7136d438ff4e65aeb08991f9826d4e5/tree_sitter_elixir-0.3.5.tar.gz")
sha256sums=('ead089393b1ce732304e6b6fb0bc0ab79e3295663d697be025bd49f0f367b74d')

build() {
    cd "${_name//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name//-/_}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
