# Maintainer: Simon Brulhart <simon@brulhart.me>

pkgname=python-taxi-zebra
_name=taxi-zebra
pkgver=5.1.4
pkgrel=1
pkgdesc="Zebra backend for Taxi"
arch=('any')
license=('custom')
url="https://github.com/liip/taxi-zebra"
depends=(python-requests)
makedepends=(python-build python-installer python-setuptools python-setuptools-git-versioning python-wheel)
source=(
    "$_name-$pkgver.tar.gz::https://github.com/liip/taxi-zebra/archive/$pkgver.tar.gz"
    "https://raw.githubusercontent.com/liip/taxi/master/LICENSE"
)
sha512sums=('b4ebe31927ee86cbb826cb19ff8383d02992d6f36c1f61be1dc6fdb5dbd1de2c772a83e19f4cbc843e58de8f4572331be2812785415003c8caecd373d6dc917b'
            '87e4e0e9f65b92db1a3f84823427b0870ae01675fa6e631a8c2e2d89eb12ee19d6011b4f4e74f6d4ca30868010206ef0ddd0b24a814c24b84bc41a5e68864dd4')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
