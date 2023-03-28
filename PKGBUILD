# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-jax'
pkgver=0.4.7
pkgrel=2
pkgdesc='Differentiate, compile, and transform Numpy code.'
arch=('any')
url='https://github.com/google/jax/'
license=('Apache')
groups=('jax')
depends=('python-absl'
         'python-jaxlib'
         'python-ml-dtypes'
         'python-numpy>=1.20'
         'python-opt_einsum'
         'python-scipy>=1.5')
optdepends=('python-protobuf: Australis')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("jax-${pkgver}.tar.gz::https://github.com/google/jax/archive/refs/tags/jax-v${pkgver}.tar.gz")
sha256sums=('4589addb4b62341bd2b89cfa17cffbf2d3cf33a8642fde2657f0ee61cf6e6b34')

build() {
    cd jax-jax-v$pkgver
    python -m build -n -w
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        jax-jax-v$pkgver/dist/jax-$pkgver-py3-*-*.whl
}
