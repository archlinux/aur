# Maintainer: agony <27015 at riseup dot net>

pkgname=graphviz2drawio
pkgver=1.2.0
pkgrel=1
pkgdesc='Convert Graphviz dot files to draw.io and Lucid (mxGraph) diagrams'
arch=('any')
url='https://github.com/hbmartin/graphviz2drawio'
license=('GPL-3.0-or-later')
depends=('python' 'python-puremagic' 'python-pygraphviz' 'python-svg.path<7')
makedepends=('python-build' 'python-installer' 'python-uv-build')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0b2ad4209b0ad1f8fb2d4ac90cb0cd60460cc244bfd60efbef2e033c4779edea')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "${pkgname}-${pkgver}"
  # test_diagrams_generate.py needs AUR python-diagrams
  python -m pytest -q --ignore=test/test_diagrams_generate.py
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
