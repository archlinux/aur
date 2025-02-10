# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-binary-memcached
pkgver=0.31.4
pkgrel=1
arch=('any')
pkgdesc='A pure python module (thread safe) to access memcached via its binary protocol with SASL auth support'
url='https://github.com/jaysonsantos/python-binary-memcached'
license=('MIT')
depends=(
    'python-six'
    'python-uhashring'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'tar'
)
checkdepends=(
    'memcached'
    'python-pytest'
    'python-trustme'
)
source=("$pkgname-$pkgver.tar.gz::https://api.github.com/repos/jaysonsantos/$pkgname/tarball/refs/tags/v$pkgver")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('702993ec7985cc43b333b497df8d8049441fc4ea91b8b922278268aa3fa0f7ffbef21f42026588da3577940b1389caac3eee54b1dfcdd62aa64a67035da34189')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build() {
    cd "$pkgname-$pkgver" || exit
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver" || exit
    python -m pytest
}

package() {
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

