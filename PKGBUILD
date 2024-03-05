# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-optax'
_pkgname=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
pkgdesc='A gradient processing and optimization library for JAX'
arch=('x86_64')
url='https://github.com/google-deepmind/optax'
license=('Apache')
groups=('jax')
depends=('python-absl' 'python-chex' 'python-jax' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-flit-core' 'python-wheel')
optdepends=('python-dm-haiku: Deep learning framework from DeepMind'
            'python-flax: Deep learning framework from Google')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a1fdcb35cb02c3b4474bfb1cc42c8e0e6f74c2492a89a039199b43045dd83d54')

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
