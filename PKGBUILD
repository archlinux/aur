# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=python-zenlib
_name=${pkgname#python-}
pkgver=3.2.1
pkgrel=1
pkgdesc='Useful python decorators and utilities'
arch=(any)
url="https://github.com/desultory/$_name"
license=(GPL-2.0-only)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$url/archive/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('f0d4c30f8103e1fa97302205e84be422c45d337034ead9912dc6ca42d30c834ee454c73c2eb0b72102c0aac68d8c650c16880318c14d82cf053edf87f146e1bc')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    rm -rf test-env
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    CI=true test-env/bin/python -P -m unittest discover tests -v
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
