# Maintainer: Simon Brulhart <simon@brulhart.me>

pkgname=python-taxi-zebra
_name=taxi-zebra
pkgver=5.0.0
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
sha512sums=('d59e7f01a3a28da6e1fe2585086c93584dd8e7304b2ee258463fef6f5796063c10ae7e20f71230b83beed97cb6cab0bf7327f5d21cb1241316ef9e969e8b82b4'
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
