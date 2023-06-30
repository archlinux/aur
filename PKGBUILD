# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-chex
_pkgname=${pkgname#python-}
pkgver=0.1.81
pkgrel=1
pkgdesc="A library of utilities for helping to write reliable JAX code"
arch=('any')
url="https://github.com/deepmind/chex"
license=('Apache')
groups=('deepmind' 'jax')
depends=('python-absl'
         'python-dm-tree'
         'python-jax'
         'python-jaxlib'
         'python-numpy'
         'python-toolz'
         'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/deepmind/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7b9b4c21c51a1f47825588f481a4aabce023afe6190ec8f0c8879fdebd38bb99')

build() {
    cd "$_pkgname-$pkgver"
    python -m build -n -w
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        dist/$_pkgname-$pkgver-*.whl
}
