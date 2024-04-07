# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-tyro
_pkgname=${pkgname#python-}
pkgver=0.8.1
pkgrel=1
pkgdesc='Strongly typed, zero-effort CLI interfaces'
arch=('any')
url='https://github.com/brentyi/tyro'
license=('MIT')
groups=()
depends=(
    'python-colorama'
    'python-docstring-parser'
    'python-rich'
    'python-shtab'
    'python-typing_extensions'
)
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ef0074501b2ee1d5b2d86c5c01cc0d77a204f43bb818717c9cd5e9e268d43c99')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver-*-*.whl
}
