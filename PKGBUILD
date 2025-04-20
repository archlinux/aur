# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-jax'
pkgver=0.6.0
pkgrel=1
pkgdesc='Composable transformations of Python+NumPy programs'
arch=('any')
url='https://github.com/jax-ml/jax/'
license=('Apache-2.0')
groups=('jax')
depends=('python-absl'
         'python-jaxlib>=0.5.3'
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
sha256sums=('07ec7a19c3a27c4cca88288f9e9477a62cd0b54bd43c4a77f497505ddadc72ed')

build() {
    JAX_RELEASE=$pkgver python -m build -nw jax-jax-v$pkgver
}

package() {
    cd jax-jax-v$pkgver
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/jax-$pkgver-*.whl
}
