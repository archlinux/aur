# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-optax'
_pkgname=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
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
sha256sums=('e57f6bb2704e8fc99014419a725658bedb6c9653245d20b358c995d5293682ec')

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
