# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-jax'
pkgver=0.4.36
pkgrel=1
pkgdesc='Composable transformations of Python+NumPy programs'
arch=('any')
url='https://github.com/jax-ml/jax/'
license=('Apache')
groups=('jax')
depends=('python-absl'
         'python-jaxlib>=0.4.35'
         'python-ml-dtypes'
         'python-numpy'
         'python-opt_einsum'
         'python-scipy')
optdepends=(
    'python-protobuf: Australis'
    'python-requests: Distributed computations'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("jax-${pkgver}.tar.gz::$url/archive/refs/tags/jax-v${pkgver}.tar.gz")
sha256sums=('442bfdf491b509995aa160361e23a9db488d5b97c87e6648cc733501b06eda77')

build() {
    JAX_RELEASE=$pkgver python -m build -nw jax-jax-v$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        jax-jax-v$pkgver/dist/jax-$pkgver-*.whl
}
