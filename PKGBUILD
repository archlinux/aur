# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-triton
_pkgname=${pkgname#python-}
pkgver=2.1.0
pkgrel=1
pkgdesc='Triton compiler'
arch=('x86_64')
url='https://github.com/openai/triton'
license=('MIT')
groups=('openai')
depends=()
makedepends=('cmake' 'ninja' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://github.com/openai/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
        'triton.diff')
sha256sums=('4338ca0e80a059aec2671f02bfc9320119b051f378449cf5f56a1273597a3d99'
            'SKIP')

prepare() {
    cd triton-$pkgver
    patch -p 1 -i ../triton.diff
}

build() {
    python -m build -nw $_pkgname-$pkgver/python
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/python/dist/$_pkgname-$pkgver-*.whl
}
