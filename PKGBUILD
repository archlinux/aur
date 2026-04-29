# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-objc
pkgname=python-tree-sitter-objc
pkgver=3.0.2
pkgrel=5
pkgdesc="Objective-C grammar for tree-sitter"
arch=('any')
url="https://pypi.org/project/tree-sitter-objc/"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/d6/f2/f979251e2100753160fcee515bc36ee60997c2e79d166232c93bc6519e02/tree_sitter_objc-3.0.2.tar.gz")
sha256sums=('ac55aefe8a4f3ea6f1da2a2e05372a4f37100001934e36a81e0f96c4c6252809')


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
