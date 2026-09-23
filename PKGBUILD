# Maintainer: Robin Trioux <robin@trioux.eu>

pkgname=python-miniaudio
pkgver=1.71
pkgrel=1
pkgdesc="Python bindings for the miniaudio audio playback, recording, decoding and conversion library"
arch=('x86_64')
url="https://github.com/irmen/pyminiaudio"
license=('MIT')
depends=(
    'python'
    'python-cffi'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/m/miniaudio/miniaudio-${pkgver}.tar.gz")
sha256sums=('ff51e2887bb673e2e757752b586b3dc924d59aa5fbcae9bbc45f4a111bd3262b')

build() {
    cd "miniaudio-${pkgver}"

    python -m build --wheel --no-isolation
}

package() {
    cd "miniaudio-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

