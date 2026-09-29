# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-groovy
pkgname=python-tree-sitter-groovy
pkgver=0.1.2
pkgrel=4
_commit=70efb0b9b50f95bcbd89dcfd42b275e0304e10cf
pkgdesc="Groovy grammar for tree-sitter"
arch=('x86_64' 'aarch64')
url="https://github.com/amaanq/tree-sitter-groovy"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=(
    "${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/amaanq/tree-sitter-groovy/archive/${_commit}.tar.gz"
    "LICENSE"
)
sha256sums=('c0538d9f9cb0be5721b53636e6c97bdab336064124cd919494d83625003638c0'
            '0eea8dc45e89deeb03c7799bbbc7b4688f365fb274562f4540ecfebdea82e727')

build() {
    cd "${_name}-${_commit}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${_commit}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
