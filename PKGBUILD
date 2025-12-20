# Maintainer: Andreas Wendleder <gonsolo@gmail.com>
pkgname=python-ciel
pkgver=2.3.1
pkgrel=2
pkgdesc="A tool for managing Process Design Kits (PDKs) for ASIC and FPGA flows."
arch=('any')
url="https://github.com/fossi-foundation/ciel"
license=('Apache-2.0')

depends=(
    'git'
    'python'
    'python-pyyaml'
    'python-zstandard'
)

makedepends=(
    'python-setuptools'
    'python-build'
    'python-installer'
    'python-wheel'
)

source=("ciel-${pkgver}.tar.gz::https://github.com/fossi-foundation/ciel/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e19cfb40d4153663a562b8d782483fbf5061b0d84e81acade5254d92c77c21cf')

build() {
    cd "ciel-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "ciel-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    find "$pkgdir" -type d -name "__pycache__" -exec rm -rf {} +
}
