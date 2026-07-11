# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=python-zenlib
_name=${pkgname#python-}
pkgver=3.5.0
pkgrel=1
pkgdesc='Useful python decorators and utilities'
arch=(any)
url=https://github.com/desultory/$_name
license=(GPL-2.0-only)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-cryptography)
optdepends=('python-cryptography: crypto module support')
source=($url/archive/$pkgver/$_name-$pkgver.tar.gz)
b2sums=('8beb0d5c47d5370d096780f99e8a08954b1696d71c1647779a7e02a958f54265c3abe131f8db9379c4c059e7dbd1068f6ba4413116e3f33a7eaed65062355f77')

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
