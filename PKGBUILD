# Maintainer: Andreas Wendleder <gonsolo@gmail.com>
pkgname=python-ciel
pkgver=2.4.0
pkgrel=1
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
sha256sums=('8f24689308c73bd4ef28f21eaee0d6d9429b701b0a5af72e14c186a19e9e5417')

build() {
    cd "ciel-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "ciel-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    find "$pkgdir" -type d -name "__pycache__" -exec rm -rf {} +
}
