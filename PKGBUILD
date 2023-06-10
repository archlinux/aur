# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib-cuda
pkgver=0.4.12
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
         'python-ml-dtypes'
         'python-numpy'
         'python-scipy')
makedepends=('python-installer' 'python-setuptools' 'python-wheel')
conflicts=('python-jaxlib')
provides=('python-jaxlib')
source=("jaxlib-${pkgver}.tar.gz::https://github.com/google/jax/archive/refs/tags/jaxlib-v${pkgver}.tar.gz")
sha256sums=('90bdaf1351809f6d73ffc20dbdd4390293742a62368e33870ef3a67e2ce52647')

build() {
    cd $srcdir/jax-jaxlib-v$pkgver
    python build/build.py \
        --cuda_compute_capabilities 7.5,8.0,8.6,8.7,9.0 \
        --cuda_path /opt/cuda \
        --cudnn_path /usr \
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
