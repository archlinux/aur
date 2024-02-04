# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-optax'
_pkgname=${pkgname#python-}
pkgver=0.1.9
pkgrel=1
pkgdesc='A gradient processing and optimization library for JAX'
arch=('x86_64')
url='https://github.com/deepmind/optax'
license=('Apache')
groups=('jax')
depends=('python-absl'
         'python-chex'
         'python-jax'
         'python-numpy'
         'python-typing_extensions>=3.10.0')
makedepends=('python-build' 'python-installer' 'python-flit-core' 'python-wheel')
optdepends=('python-dm-haiku: Deep learning framework from DeepMind'
            'python-flax: Deep learning framework from Google')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/deepmind/optax/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c07564139fbed098d21298dbe409c11cd7db162044839973b34ca06b6f091b20')

build() {
    python -m build -n -w "$_pkgname-$pkgver"
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver-*.whl
}
