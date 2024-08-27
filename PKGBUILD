# Mantainer: sgar < swhaat at github >

pkgname=python-aioesphomeapi
pkgbasename=aioesphomeapi
pkgver=24.6.2
pkgrel=1
pkgdesc="Python Client for ESPHome native API. Used by Home Assistant."
url="https://github.com/esphome/aioesphomeapi"
depends=('python-setuptools'
    'python-aiohappyeyeballs'
    'python-async_interrupt'
    'python-protobuf'
    'python-zeroconf'
    'python-chacha20poly1305-reuseable'
    'python-cryptography'
    'python-noiseprotocol-git'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'cython')
license=('MIT')
arch=('any')
source=("https://github.com/esphome/aioesphomeapi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ff503c69c92d8f928541b53eededebc6ea0e908caec6c5783cde3940d7029908')

prepare() {
    cd "$srcdir/${pkgbasename}-${pkgver}"
    sed -i 's/==.*//' requirements.txt
}

build() {
    cd "$srcdir/${pkgbasename}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgbasename}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
