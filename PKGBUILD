# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-optax'
pkgver=0.1.4
pkgrel=1
pkgdesc='Optax is a gradient processing and optimization library for JAX'
arch=('x86_64')
url='https://github.com/deepmind/optax'
license=('Apache')
# TODO(@daskol): Introduce chex and dm-tree.
depends=('python-absl>=0.7.1'
         'python-jax>=0.1.55'
         'python-jaxlib>=0.1.37'
         'python-numpy>=1.18.0'
         'python-typing_extensions>=3.10.0')
makedepends=('python-pip' 'python-setuptools')
optdepends=('python-flax')
source=("optax-${pkgver}.tar.gz::https://github.com/deepmind/optax/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4d901dc238938f5fc4c09ee90d69f743782e6283a814a323e57acca865d6eb1d')

package() {
    cd "$srcdir/optax-$pkgver"
    pip install --ignore-installed --no-deps --root $pkgdir chex dm-tree
    python setup.py install \
        --root $pkgdir

    # TODO(@daskol): Fix setup.py of optax.
    rm -rfv $pkgdir/usr/lib/python3.10/site-packages/build
    rm -rfv $pkgdir/usr/lib/python3.10/site-packages/docs
    rm -rfv $pkgdir/usr/lib/python3.10/site-packages/examples
}
