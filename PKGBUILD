# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-verilog
pkgname=python-tree-sitter-verilog
pkgver=1.0.3
pkgrel=5
pkgdesc="Verilog grammar for tree-sitter"
arch=('any')
url="https://pypi.org/project/tree-sitter-verilog/"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/d1/b6/9b3b72c3478caa07c346550c66c6e77759c76785c82d1dd5408230e58e45/tree_sitter_verilog-1.0.3.tar.gz")
sha256sums=('d4043cba50e1ba8402396e3106e17de755c86eca311b23ab826e018ea9818984')


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
