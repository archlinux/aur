# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-tyro
_pkgname=${pkgname#python-}
pkgver=0.8.11
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
sha256sums=('8170fde4f24e2ef65cff2e724b07125dcf52f3df24a78c679810ef15b16a66c7')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver-*-*.whl
}
