# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-dm
pkgname=python-tree-sitter-dm
pkgver=0.26.0
pkgrel=1
pkgdesc="DreamMaker grammar for tree-sitter"
arch=('x86_64' 'aarch64')
url="https://github.com/feudeytf/tree-sitter-dm"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('88f185c9c32d3032ad1613674c71580bc8def7e38c9d2a7719dcf061c5c84ecb')

build() {
    cd "${_name//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name//-/_}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
