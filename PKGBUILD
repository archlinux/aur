_pkgname="aiohttp-client-cache"
pkgname="python-$_pkgname"
pkgver=0.12.4
pkgrel=1
pkgdesc="An async persistent cache for aiohttp requests"
arch=('any')
depends=(
    python
    python-url-normalize
)
makedepends=(
    python-build
    python-installer
    python-poetry-core
    python-wheel
)
url="https://github.com/requests-cache/aiohttp-client-cache"
license=('MIT')

source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('e60fe816136b5b1d66f3bb6b272ab81d97854ea1e4d9b57085a360426967d265')

build(){
    cd ${_pkgname//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd ${_pkgname//-/_}-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
