# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-tyro
_pkgname=${pkgname#python-}
pkgver=0.8.10
pkgrel=1
pkgdesc='Strongly typed, zero-effort CLI interfaces'
arch=('any')
url='https://github.com/brentyi/tyro'
license=('MIT')
groups=()
depends=(
    'python-docstring-parser'
    'python-rich'
    'python-shtab'
    'python-typing_extensions'
)
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('04eb27241165c861a316d0e4bb680cae23ff5f8369f7e48ac0d9e511b064e89f')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver-*-*.whl
}
