# Maintainer: Simon Brulhart <simon@brulhart.me>

pkgname=python-taxi-zebra
_name=taxi-zebra
pkgver=5.1.1
pkgrel=1
pkgdesc="Zebra backend for Taxi"
arch=('any')
license=('custom')
url="https://github.com/liip/taxi-zebra"
depends=(python-requests)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(
    "$_name-$pkgver.tar.gz::https://github.com/liip/taxi-zebra/archive/$pkgver.tar.gz"
    "https://raw.githubusercontent.com/liip/taxi/master/LICENSE"
)
sha512sums=('dfd7d06a1e36608999c8915a135c47758fab1147effdbc22fa8f294653580eba5565b89a5c024947a5f1f327bb6fae959ed3bbb05d7ddb6634ca3e2cc65530d3'
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
