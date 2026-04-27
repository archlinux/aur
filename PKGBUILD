# Maintainer: Your Name <your.email@example.com>

_name=tree-sitter-scala
pkgname=python-tree-sitter-scala
pkgver=0.26.0
pkgrel=1
pkgdesc="Scala grammar for tree-sitter"
arch=('any')
url="https://pypi.org/project/tree-sitter-scala/"
license=('MIT')
depends=('python' 'python-tree-sitter')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/39/cd/993b418057ad5a8aae67fa895905634a418e3c7bd176452c6f97be8bd6d4/tree_sitter_scala-0.26.0.tar.gz")
sha256sums=('7f768094afbed10c07e60c202e275efc683418eeae4bdeff2c16f2ea0744939f')

build() {
    cd "${_name//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name//-/_}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
