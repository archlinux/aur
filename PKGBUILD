# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-lua
pkgname=python-tree-sitter-lua
pkgver=0.5.0
pkgrel=5
pkgdesc="Lua grammar for tree-sitter"
arch=('any')
url="https://pypi.org/project/tree-sitter-lua/"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/94/07/98d7c5f60c9a79a1d40f85e59b7c25a0102d2eebcc5a83608c7c308edf22/tree_sitter_lua-0.5.0.tar.gz")
sha256sums=('0e46356038ccb8ce1049289104c56230003448309a335f2e353f1edc7b373552')


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
