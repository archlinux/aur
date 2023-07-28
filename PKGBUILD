# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib
pkgver=0.4.14
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
        'python-jaxlib.diff')
sha256sums=('9f309476a8f6337717b059b8d10b5859b4134c30cf8f1220bb70379b5e2744a4'
            'SKIP')

prepare() {
    cd $srcdir/jax-jaxlib-v$pkgver
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
