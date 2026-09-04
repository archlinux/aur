# Maintainer: Andreas Wendleder <gonsolo@gmail.com>
pkgname=python-ciel
pkgver=2.6.1
pkgrel=1
pkgdesc="A tool for managing Process Design Kits (PDKs) for ASIC and FPGA flows."
arch=('any')
url="https://github.com/fossi-foundation/ciel"
license=('Apache-2.0')

depends=(
    'git'
    'python'
    'python-click'
    'python-httpx'
    'python-pcpp'
    'python-pyyaml'
    'python-rich'
    'python-truststore'
    'python-zstandard'
)

makedepends=(
    'python-build'
    'python-installer'
    'python-poetry-core'
    'python-setuptools'
    'python-wheel'
)

source=("ciel-${pkgver}.tar.gz::https://github.com/fossi-foundation/ciel/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f59fe1e76932deab4414f14558d910a1ee0e25b34815490f656d8ced6e531377')

build() {
    cd "ciel-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "ciel-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    find "$pkgdir" -type d -name "__pycache__" -exec rm -rf {} +
}
