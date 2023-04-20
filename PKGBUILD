# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-optax'
_pkgname=${pkgname#python-}
pkgver=0.1.5
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
makedepends=('python-build' 'python-installer' 'python-setuptools')
optdepends=('python-dm-haiku: Deep learning framework from DeepMind'
            'python-flax: Deep learning framework from Google')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/deepmind/optax/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ff4180ae5f6601baba6445d22a465e7af3c2b485032e46929571d00c688ae7dc')

build() {
    python -m build -n -w "$_pkgname-$pkgver"
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver-*.whl

    # TODO(@daskol): Fix setup.py of optax.
    rm -rfv $pkgdir/usr/lib/python3.10/site-packages/build
    rm -rfv $pkgdir/usr/lib/python3.10/site-packages/docs
    rm -rfv $pkgdir/usr/lib/python3.10/site-packages/examples
}
