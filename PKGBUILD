# Maintainer: Lucas Balmès <lucagoc@pm.me>
pkgname=python-pypixelcolor
_name=pypixelcolor
pkgver=0.4.0
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
    'python-websockets'
)
optdepends=(
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
sha256sums=('344becefe853067ab291efa5607ea572c21363636cb1f3824f326a4eb2566cc8')

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
