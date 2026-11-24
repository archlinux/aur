# Maintainer: Marek Mahut <marek@mahut.dev>

pkgname=badfish
pkgver=1.10.0
pkgrel=1
pkgdesc="Redfish-based API tool for managing bare-metal systems via out-of-band management"
arch=('any')
url="https://github.com/quadsproject/badfish"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-yaml'
    'python-aiohttp'
    'python-setuptools'
    'python-async-lru'
    'python-rich'
)
optdepends=(
    'python-aiohttp-socks: for --proxy SOCKS proxy support'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quadsproject/badfish/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1754ced50182d4e03c4001f0d0504bd2b2bae533f6b4cdc3e16921a8d9613d47')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
