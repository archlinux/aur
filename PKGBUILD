# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-limits
pkgver=3.2.0
pkgrel=1
pkgdesc="utilities to implement rate limiting"
url="https://github.com/alisaifee/limits/"
makedepends=(python-build python-installer python-wheel)
depends=(python-deprecated python-typing_extensions python-packaging python-setuptools)
license=('MIT')
arch=('any')
source=("https://github.com/alisaifee/limits/archive/${pkgver}.tar.gz")

sha256sums=('969c166f89bf5cfc940c7194c7dff7ee999a648c8fa5f9f297d78250c8e44e1a')

# too many deps right now
#check() {
#    cd "${srcdir}/limits-${pkgver}"
#    PYTHONPATH=. pytest tests
#}

build() {
    cd "${srcdir}/limits-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/limits-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

