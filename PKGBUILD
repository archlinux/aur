# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-jax'
pkgver=0.4.15
pkgrel=1
pkgdesc='Differentiate, compile, and transform Numpy code.'
arch=('any')
url='https://github.com/google/jax/'
license=('Apache')
groups=('jax')
depends=('python-absl'
         'python-jaxlib>=0.4.12'
         'python-ml-dtypes'
         'python-numpy'
         'python-opt_einsum'
         'python-scipy')
optdepends=('python-protobuf: Australis')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("jax-${pkgver}.tar.gz::https://github.com/google/jax/archive/refs/tags/jax-v${pkgver}.tar.gz")
sha256sums=('e03aaeb828599dc3921d74a0137dcfa60439861410a97b2d3525fad23586b97a')

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
