# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib
pkgver=0.3.15
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
source=('git+https://github.com/google/jax.git')
md5sums=('SKIP')

pkgver() {
    cd $srcdir/jax
    git describe --match 'jaxlib-*' | sed 's/^jaxlib-v//;s/-.*$//'
}

prepare() {
    cd $srcdir/jax
    git checkout "jaxlib-v$pkgver"
}

build() {
    cd $srcdir/jax
    python build/build.py \
        --target_cpu_features native
}

package() {
    cd $srcdir/jax
    ls -l dist
    python -m pip install \
        --root $pkgdir \
        dist/*.whl
}
