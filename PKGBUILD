_pkgname="aiolimiter"
pkgname="python-$_pkgname"
pkgver=1.1.0
pkgrel=1
pkgdesc="An efficient implementation of a rate limiter for asyncio"
arch=('any')
depends=(
    python
    python-importlib-metadata
)
makedepends=(
    python-build
    python-installer
    python-poetry-core
    python-wheel
)
url="https://github.com/mjpieters/aiolimiter"
license=('MIT')

source=("https://files.pythonhosted.org/packages/source/a/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('461cf02f82a29347340d031626c92853645c099cb5ff85577b831a7bd21132b5')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
