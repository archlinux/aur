# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-chex
_pkgname=${pkgname#python-}
pkgver=0.1.7
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
         'python-typing_extensions'
         'python<3.11')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/deepmind/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d9734b1cfddad95e77b110f32086ba1240e87e0eeffc93b5d2c2759bb1e1caf0')

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
