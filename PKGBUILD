# Maintainer: Robin Ekman < robin.seth.ekman [at] gmail [dot] com >

pkgname=python-ass
pkgver=1.0.1
pkgrel=1
pkgdesc="A library for parsing and manipulating Advanced SubStation Alpha subtitle files."
url='http://github.com/chireiden/python-ass'
arch=('any')
license=('MIT')
depends=(
    'python>=3.8'
    'libass'
)
makedepends=('python-uv-build')
checkdepends=(
    'python-pytest'
    'python-pillow'
)
source=(
    "https://github.com/chireiden/python-ass/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    "4135bcab58910707c63c2011a242b19cc1b0e39265fc2f325abf02fde0a6415f"
)

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check () {
    cd "${pkgname}-${pkgver}"
    export PYTHONPATH=$(pwd)/src
    pytest tests
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
