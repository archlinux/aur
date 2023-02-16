# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-jax'
pkgver=0.4.3
pkgrel=3
pkgdesc='Differentiate, compile, and transform Numpy code.'
arch=('any')
url='https://github.com/google/jax/'
license=('Apache')
depends=('python-absl'
         'python-jaxlib'
         'python-numpy>=1.20'
         'python-opt_einsum'
         'python-scipy>=1.5')
optdepends=('python-protobuf: Australis')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("jax-${pkgver}.tar.gz::https://github.com/google/jax/archive/refs/tags/jax-v${pkgver}.tar.gz")
sha256sums=('02673471d7d366cbd3ea0a851199cc08b02b3a354d07940f68d1e65544135eae')

build() {
    cd jax-jax-v$pkgver
    python -m build -n -w
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        jax-jax-v$pkgver/dist/jax-$pkgver-py3-*-*.whl
}
