# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-cibuildwheel
_pkgname=${pkgname#python-}
pkgver=2.23.3
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
sha256sums=('b2ffc592554844163de29825e3b45d9012d3f9c63cca2c4d306b4ab005393820')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
    cd $_pkgname-$pkgver
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/$_pkgname-$pkgver-*-*.whl
}
