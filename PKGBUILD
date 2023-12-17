# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-chex
_pkgname=${pkgname#python-}
pkgver=0.1.85
pkgrel=1
pkgdesc="A library of utilities for helping to write reliable JAX code"
arch=('any')
url="https://github.com/google-deepmind/chex"
license=('Apache')
groups=('deepmind' 'jax')
depends=('python-absl'
         'python-dm-tree'
         'python-jax'
         'python-jax>=0.4.16'
         'python-numpy'
         'python-toolz'
         'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-cloudpickle' 'python-dm-tree')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/google-deepmind/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('04ba86b2a5a9efe39e21ccf30c890867e2055c678378968c5adc128feb742d58')

build() {
    python -m build -nw "$_pkgname-$pkgver"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        dist/$_pkgname-$pkgver-*.whl
}
