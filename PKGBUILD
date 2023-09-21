# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib
pkgver=0.4.16
pkgrel=1
pkgdesc='XLA library for JAX'
arch=('x86_64')
url='https://github.com/google/jax/'
license=('Apache')
groups=('jax')
depends=('python-absl'
         'python-flatbuffers'
         'python-ml-dtypes'
         'python-numpy'
         'python-scipy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
conflicts=('python-jaxlib')
source=("jaxlib-${pkgver}.tar.gz::https://github.com/google/jax/archive/refs/tags/jaxlib-v${pkgver}.tar.gz"
        'python-jax.diff'
        'python-jaxlib.diff')
sha256sums=('85c8bc050abe0a2cf62e8cfc7edb4904dd3807924b5714ec6277f291c576b5ca'
            'cfc113d5de5d6bc9262d10c7a8acd4dd26fff88fc105856a2eb638fb10725827'
            '3d7f563fdad2cec0a860f7dfaa3ff2f5e63fa016a6dd7fa9bb2dd9233a4b755e')

prepare() {
    cd $srcdir/jax-jaxlib-v$pkgver
    patch -p1 -i ../python-jax.diff
    patch -p1 -i ../python-jaxlib.diff
}

build() {
    cd $srcdir/jax-jaxlib-v$pkgver
    python build/build.py \
        --target_cpu_features release
}

package() {
    cd $srcdir/jax-jaxlib-v$pkgver
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $srcdir/jax-jaxlib-v$pkgver/dist/jaxlib-$pkgver-*.whl
}
