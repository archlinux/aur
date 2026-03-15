# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-amqp
pkgver=5.3.1
pkgrel=4
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="https://github.com/celery/py-amqp"
license=('BSD-3-Clause')
depends=(
    'python'
    'python-vine'
)
makedepends=(
    'python-setuptools'
    'python-build'
    'python-installer'
    'python-wheel'
    'git'
)
checkdepends=(
    'python-pytest'
)
source=("$pkgname::git+$url.git#tag=v$pkgver")
b2sums=('0eb3e97fdca83beb604b183190a7148efaf1359e7e45aedad2efa2aef42d190dc9973c5b1f81e7a6d15877f81260182a1b13d5b56679f89cac6a9bcd4b841ff3')

build() {
    cd $pkgname
    python -m build --wheel --no-isolation
}

check() {
    cd $pkgname
    pytest -k "not test_gssapi_missing"
}

package() {
    cd $pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
