# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=tree-sitter-groovy
pkgname=python-tree-sitter-groovy
pkgver=0.1.2
pkgrel=2
pkgdesc="Groovy grammar for tree-sitter"
arch=('x86_64')
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
    "${pkgname}-${pkgver}.tar.gz::https://github.com/amaanq/tree-sitter-groovy/archive/refs/tags/v${pkgver}.tar.gz"
    "LICENSE"
)
sha256sums=('d3eafa455e3a092d79c2d3488fa58a461c1a18cdfa1b7edb22e168b513e454fe'
            '0eea8dc45e89deeb03c7799bbbc7b4688f365fb274562f4540ecfebdea82e727')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
