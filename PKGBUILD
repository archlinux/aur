# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-powershell
pkgname=python-tree-sitter-powershell
pkgver=0.26.3
pkgrel=5
pkgdesc="A Powershell grammar for tree-sitter"
arch=('any')
url="https://pypi.org/project/tree-sitter-powershell/"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/55/bc/5f0735a5836fab553c13673897988d2782d52cb0ca0541f47032b2c63e27/tree_sitter_powershell-0.26.3.tar.gz")
sha256sums=('9f349e60a55f29e98bbe12b19d16e95d5956f9816d7df974d57b806787389330')


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
