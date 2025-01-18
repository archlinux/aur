# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-tyro
_pkgname=${pkgname#python-}
pkgver=0.9.11
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
    'python-typeguard'
    'python-typing_extensions'
)
makedepends=('python-build' 'python-installer' 'python-hatchling'
             'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2f48c041a80fd6a77c51262613873fc86abac73b3151e109bd54800196ce4268')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver-*-*.whl
}
