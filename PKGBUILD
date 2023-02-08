# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-jax'
pkgver=0.4.3
pkgrel=1
pkgdesc='Differentiate, compile, and transform Numpy code.'
arch=('x86_64')
url='https://github.com/google/jax/'
license=('Apache')
depends=('absl-py'
         'python'
         'python-jaxlib'
         'python-numpy>=1.20'
         'python-opt_einsum'
         'python-scipy>=1.5')
optdepends=('python-protobuf: Australis')
makedepends=('python-installer' 'python-setuptools')
source=("jax-${pkgver}.tar.gz::https://github.com/google/jax/archive/refs/tags/jax-v${pkgver}.tar.gz")
sha256sums=('02673471d7d366cbd3ea0a851199cc08b02b3a354d07940f68d1e65544135eae')

build() {
    cd $srcdir/jax-jax-v$pkgver
    python setup.py bdist_wheel
}

package() {
    echo $srcdir/jax-jax-v$pkgver/dist/jax-$pkgver-py3-*-*.whl
    python -m installer \
        --compile-bytecode 1 \
        --prefix $pkgdir \
        $srcdir/jax-jax-v$pkgver/dist/jax-$pkgver-py3-*-*.whl
}
