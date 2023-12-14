# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-jax'
pkgver=0.4.22
pkgrel=1
pkgdesc='Composable transformations of Python+NumPy programs'
arch=('any')
url='https://github.com/google/jax/'
license=('Apache')
groups=('jax')
depends=('python-absl'
         'python-jaxlib>=0.4.14'
         'python-ml-dtypes'
         'python-numpy'
         'python-opt_einsum'
         'python-scipy')
optdepends=('python-protobuf: Australis')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("jax-${pkgver}.tar.gz::https://github.com/google/jax/archive/refs/tags/jax-v${pkgver}.tar.gz")
sha256sums=('7edc29c16f2cedd7677bb33bfd9e8e211a1daa6bedd6393f77c272b0eb496fe0')

build() {
    JAX_RELEASE=$pkgver python -m build -nw jax-jax-v$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        jax-jax-v$pkgver/dist/jax-$pkgver-*.whl
}
