# Maintainer: Lucas Balmès <lucagoc@pm.me>
pkgname=python-pypixelcolor
_name=pypixelcolor
pkgver=0.5.0
pkgrel=1
pkgdesc="A Python library and CLI to control iPixel Color devices"
arch=('any')
url="https://github.com/lucagoc/pypixelcolor"
license=('MIT')
depends=(
    'python'
    'python-bleak'
    'python-crccheck'
    'python-pillow'
)
optdepends=(
    'python-rich: enhanced CLI output'
    'python-websockets: WebSocket server bridge'
    'python-pillow-heif: HEIF/HEIC image format support'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
)
checkdepends=(
    'python-pytest'
)
provides=('pypixelcolor')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7a4613898674d5aca9ea425b904b4b3561f6595539a29b3a6a4e6f19638c229e')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"
    PYTHONPATH=src pytest
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
