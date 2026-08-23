# Maintainer: user14923929
pkgname=steganoforge
pkgver=0.1.0
pkgrel=2
pkgdesc="Hide and extract files inside PNG images via LSB steganography, with CLI and web UI"
arch=('any')
url="https://github.com/user14923929/steganoforge"
license=('GPL3')
depends=(
    'python'
    'python-pillow'
    'python-numpy'
    'python-cryptography'
)
optdepends=(
    'python-fastapi: for the web UI'
    'uvicorn: for running the web UI server'
    'python-multipart: required by the web UI for file uploads'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('88dc895bf37477a3d07dc8349cb442d3f67d3879fdbd0e77aefa330514065746')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver"
    python -m pytest tests/
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
