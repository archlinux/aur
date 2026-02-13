# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=limits
pkgname=python-limits
pkgver=5.8.0
pkgrel=1
pkgdesc="utilities to implement rate limiting"
url="https://github.com/alisaifee/limits/"
makedepends=(python-hatchling python-hatch-vcs python-build python-installer python-wheel)
depends=(python-deprecated python-typing_extensions python-packaging)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")

sha256sums=('c9e0d74aed837e8f6f50d1fcebcf5fd8130957287206bc3799adaee5092655da')

# too many deps right now
#check() {
#    cd "${srcdir}/limits-${pkgver}"
#    PYTHONPATH=. pytest tests
#}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

