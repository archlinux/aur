# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=limits
pkgname=python-limits
pkgver=3.10.0
pkgrel=1
pkgdesc="utilities to implement rate limiting"
url="https://github.com/alisaifee/limits/"
makedepends=(python-build python-installer python-wheel)
depends=(python-deprecated python-typing_extensions python-packaging python-setuptools python-importlib-resources)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")

sha256sums=('6e657dccafce64fd8ee023ebf4593cd47e9eac841fd1dec3448f48673ba10b7c')

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

