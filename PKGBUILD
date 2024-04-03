# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-jax'
pkgver=0.4.25
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
sha256sums=('8b30af49688c0c13b82c6f5ce992727c00b5fc6d04a4c6962012f4246fa664eb')

build() {
    JAX_RELEASE=$pkgver python -m build -nw jax-jax-v$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        jax-jax-v$pkgver/dist/jax-$pkgver-*.whl
}
