_pkgname="aiolimiter"
pkgname="python-$_pkgname"
pkgver=1.2.0
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
sha256sums=('761455d26df0d7a393f78bd39b022579e02ca5a65beb303a67bed2ded2f740ac')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
