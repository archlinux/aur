# Maintainer: Your Name <your.email@example.com>

_name=tree-sitter-julia
pkgname=python-tree-sitter-julia
pkgver=0.23.1
pkgrel=1
pkgdesc="Julia grammar for tree-sitter"
arch=('any')
url="https://pypi.org/project/tree-sitter-julia/"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/d5/e7/1ff7d38967471f13b77420cdfc58ce170c8ceb83ff4b55ce50744c076e79/tree_sitter_julia-0.23.1.tar.gz")
sha256sums=('07607c4fc902b21e6821622f56b08aa2321b921fe0644e2ab4aba1747e6c8808')

build() {
    cd "${_name//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name//-/_}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
