# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-tyro
_pkgname=${pkgname#python-}
pkgver=0.9.21
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
sha256sums=('3e4f88978da69b567417792fcb9e3ad04f5cfe06aa5b373d41eeb03b98f6be91')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/$_pkgname-$pkgver-*-*.whl
}
