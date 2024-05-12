# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=limits
pkgname=python-limits
pkgver=3.12.0
pkgrel=1
pkgdesc="utilities to implement rate limiting"
url="https://github.com/alisaifee/limits/"
makedepends=(python-build python-installer python-wheel)
depends=(python-deprecated python-typing_extensions python-packaging python-setuptools python-importlib-resources)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")

sha256sums=('95764065715a11b9fdcc82558cac2fb59a1febbb7aa2acd045f72ab0c16ec04f')

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

