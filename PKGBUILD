# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-optax'
_pkgname=${pkgname#python-}
pkgver=0.1.4
pkgrel=3
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
sha256sums=('4d901dc238938f5fc4c09ee90d69f743782e6283a814a323e57acca865d6eb1d')

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
