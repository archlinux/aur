# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib-cuda
pkgver=0.4.4
pkgrel=2
pkgdesc='XLA library for JAX'
arch=('x86_64')
url='https://github.com/google/jax/'
license=('Apache')
groups=('jax')
depends=('absl-py'
         'cuda'
         'cudnn'
         'nccl'
         'python-flatbuffers'
         'python-numpy'
         'python-scipy')
makedepends=('python-installer' 'python-setuptools' 'python-wheel')
conflicts=('python-jaxlib')
provides=('python-jaxlib')
source=("jaxlib-${pkgver}.tar.gz::https://github.com/google/jax/archive/refs/tags/jaxlib-v${pkgver}.tar.gz")
sha256sums=('881f402c7983b56b185e182d5315dd64c9f5320be96213d0415996ece1826806')

build() {
    cd $srcdir/jax-jaxlib-v$pkgver
    python build/build.py \
        --enable_cuda \
        --enable_nccl
}

package() {
    cd $srcdir/jax-jaxlib-v$pkgver
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $srcdir/jax-jaxlib-v$pkgver/dist/jaxlib-$pkgver-*.whl
}
