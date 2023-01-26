# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib
pkgver=0.4.2
pkgrel=2
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
sha256sums=('c84a6c0740533edac63a6e56a0b4a109c9293b412a805905e9d00ebeebc09738')

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
