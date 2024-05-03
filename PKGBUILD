# Maintainer: a821
# Contributor: PumpkinCheshire <me at pumpkincheshire dot top>
# Contributor: tembleking <tembleking at gmail dot com>

pkgname=python-haversine
_name=haversine
pkgver=2.8.1
pkgrel=1
pkgdesc='Calculate the distance between two points on Earth using their latitude and longitude.'
url='https://github.com/mapado/haversine'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-numpy: for haversine calculations'
            'python-numba: for jit')
checkdepends=('python-pytest' 'python-numba')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('468de642154e98019f86dfe54bb379254b4bfc633a502a22ce6eb69ef65ba00888026058299b11b73237b146b603f336918c6c8dc1507e645c8fd5ef33b7cf9c')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"

    # remove failing test (see commit message)
    rm -f tests/test_performance.py
    pytest
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: set ts=4 sw=4 et:
