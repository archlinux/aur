# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-geoopt
_pkgname=${pkgname#python-}
pkgver=0.5.1
pkgrel=1
pkgdesc='Riemannian Adaptive Optimization Methods with pytorch optim'
arch=('any')
url='https://github.com/geoopt/geoopt'
license=('Apache')
groups=()
depends=('python-numpy' 'python-scipy' 'python-pytorch')
makedepends=('python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/geoopt/geoopt/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('b46bc64c25f366ab9208838c8c61a4747b6c3190312b1b29ddfa42ba9585286b')

prepare() {
    sed -i "s/0.5.0/$pkgver/" $_pkgname-v.${pkgver}/geoopt/__init__.py
}

build() {
    cd $_pkgname-v.${pkgver}
    python -m build -n -w
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-v.${pkgver}/dist/$_pkgname-$pkgver-py3-*-*.whl
}
