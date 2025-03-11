# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-dependency-groups
_pkgname=${pkgname#python-}
pkgver=1.3.0
pkgrel=1
pkgdesc='A standalone implementation of PEP 735 Dependency Groups'
arch=('any')
url='https://github.com/pypa/dependency-groups'
license=('MIT')
groups=()
depends=('python-packaging')
makedepends=('python-build' 'python-flit-core' 'python-installer'
             'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d269c6a227ec810c92d72d401c71879696183590845232e31be03beb84461d21')

build() {
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
    cd $_pkgname-$pkgver/
    install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/$_pkgname-$pkgver-*-*.whl
}
