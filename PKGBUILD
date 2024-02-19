# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-vertica
_pkgname=${pkgname#python-}-python
pkgver=1.3.8
pkgrel=1
pkgdesc='Official native Python client for the Vertica Analytics Database.'
arch=('any')
url='https://github.com/vertica/vertica-python'
license=('Apache-2.0')
depends=()
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('40bd5894e2380958a52f774537f8ee3b4b26a094207835a3212a586eb4b7d075')

build() {
    cd $_pkgname-$pkgver
    python -m build -nw
}

check() {
    cd $_pkgname-$pkgver
    python -c 'import vertica_python'
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/dist/${_pkgname//-/_}-$pkgver-*-*-*.whl
}
