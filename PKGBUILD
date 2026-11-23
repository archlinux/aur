# Maintainer: Marek Mahut <marek@mahut.dev>

pkgname=badfish
pkgver=1.9.0
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
sha256sums=('b0903b2e8fb7cd040c1fcf2b8935ecc075d90ba5ab8907144bac5a9948167ee9')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
