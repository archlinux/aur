# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib
pkgver=0.4.1
pkgrel=1
pkgdesc='XLA library for JAX'
arch=('x86_64')
url='https://github.com/google/jax/'
license=('Apache')
depends=('absl-py'
         'python'
         'python-flatbuffers'
         'python-numpy'
         'python-scipy')
makedepends=('python-pip')
source=("jaxlib-${pkgver}.tar.gz::https://github.com/google/jax/archive/refs/tags/jaxlib-v${pkgver}.tar.gz")
sha256sums=('a001de25e0b7ca5847dcbbcf4c31a8e354c0b6cdaa970b7cc4aeea027fd638d7')

build() {
    cd $srcdir/jax-jaxlib-v$pkgver
    python build/build.py \
        --target_cpu_features native
}

package() {
    cd $srcdir/jax-jaxlib-v$pkgver
    pip install \
        --ignore-installed \
        --no-deps \
        --root $pkgdir \
        dist/jaxlib-${pkgver}-*.whl
}
