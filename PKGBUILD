# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-elixir
pkgname=python-tree-sitter-elixir
pkgver=0.3.5
pkgrel=5
pkgdesc="Elixir grammar for tree-sitter"
arch=('any')
url="https://pypi.org/project/tree-sitter-elixir/"
license=('Apache-2.0')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/e8/83/0501ee426bcd40cf5f765ce66ff2e7136d438ff4e65aeb08991f9826d4e5/tree_sitter_elixir-0.3.5.tar.gz")
sha256sums=('ead089393b1ce732304e6b6fb0bc0ab79e3295663d697be025bd49f0f367b74d')


prepare() {
    cd "${_name//-/_}-${pkgver}"

    sed -i \
        -e 's/^license\.text = "MIT"$/license = "MIT"/' \
        -e 's/^license\.text = "Apache-2.0"$/license = "Apache-2.0"/' \
        -e 's/^license = "LICENSE"$/license = "MIT"/' \
        -e '/License :: OSI Approved/d' \
        pyproject.toml
}

build() {
    cd "${_name//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name//-/_}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
