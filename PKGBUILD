_pkgname="aiolimiter"
pkgname="python-$_pkgname"
pkgver=1.3.0
pkgrel=1
pkgdesc="An efficient implementation of a rate limiter for asyncio"
arch=('any')
depends=(
    python
)
makedepends=(
    python-build
    python-hatchling
    python-installer
    python-uv-dynamic-versioning
    python-wheel
)
url="https://github.com/mjpieters/aiolimiter"
license=('MIT')

source=("https://files.pythonhosted.org/packages/source/a/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('7343008c2228e89def7d4ce29ab98ee98822bf5db69018c09c90088929f7c104')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
