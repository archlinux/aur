# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=python-zenlib
_name=${pkgname#python-}
pkgver=3.3.0
pkgrel=1
epoch=1
pkgdesc='Useful python decorators and utilities'
arch=(any)
url=https://github.com/desultory/$_name
license=(GPL-2.0-only)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-cryptography)
optdepends=('python-cryptography: crypto module support')
source=($url/archive/$pkgver/$_name-$pkgver.tar.gz)
b2sums=('d4add79e69cecc0f6b08484379c28fc0ca0c505e076988fae0eb62edc1b26f77cd289014fc2b6d953568c44c477cfc2a65d1f22ac9f44f2a7783ecdeacca2dc7')

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
