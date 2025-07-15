# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-cibuildwheel
_pkgname=${pkgname#python-}
pkgver=3.0.0
pkgrel=1
pkgdesc='Build Python wheels for all the platforms with minimal configuration.'
arch=('any')
url='https://github.com/pypa/cibuildwheel'
license=('BSD-2-Clause')
groups=()
depends=('python-bashlex' 'python-bracex' 'python-certifi'
         'python-dependency-groups' 'python-filelock' 'python-packaging'
         'python-platformdirs')
makedepends=('python-build' 'python-hatchling' 'python-installer'
             'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f0fa54f3dec13aaa636a7e585a1c1dfef3154d20bd3d045d9033767ed83097fd')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
    cd $_pkgname-$pkgver
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/$_pkgname-$pkgver-*-*.whl
}
