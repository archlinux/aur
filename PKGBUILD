# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-optax'
_pkgname=${pkgname#python-}
pkgver=0.2.0
pkgrel=2
pkgdesc='A gradient processing and optimization library for JAX'
arch=('any')
url='https://github.com/google-deepmind/optax'
license=('Apache')
groups=('jax')
depends=('python-absl' 'python-chex' 'python-jax' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-flit-core' 'python-wheel')
optdepends=('python-dm-haiku: Deep learning framework from DeepMind'
            'python-flax: Deep learning framework from Google')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e3509bcf9be8768e0f19427abee1c524e64062447c185341cb27d2c30892e9fa')

prepare() {
    cd "$_pkgname-$pkgver"
    sed -i "s/^__version__.*/__version__ = '$pkgver'/" optax/__init__.py
}

build() {
    python -m build -n -w "$_pkgname-$pkgver"
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver-*.whl
}
