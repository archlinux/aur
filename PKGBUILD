# Maintainer: Daniel Bershatsky <d.bershatsky2@skoltech.ru> (aur.archlinux.org/account/daskol)
# Contributor: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)

pkgname=python-flax
_pkgname=${pkgname#python-}
pkgver=0.10.1
pkgrel=1
pkgdesc='A neural network library and ecosystem for JAX designed for flexibility'
arch=('any')
url='https://github.com/google/flax'
license=('Apache')
groups=('jax')
depends=(
    'python-jax'
    'python-msgpack'
    'python-numpy'
    'python-optax'
    'python-orbax-checkpoint'
    'python-rich'
    'python-tensorstore'
    'python-typing_extensions'
    'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-setuptools-scm' 'python-wheel')
optdepends=(
    'python-matplotlib: Export to TensorBoard.'
    'tensorboard: TensorBoard visualization and logging.'
)
source=("flax-$pkgver.tar.gz::https://github.com/google/flax/archive/refs/tags/v${pkgver}.tar.gz"
        'python-flax.diff')
sha256sums=('806160b971a0eb940e362b928497b385035c70399048e339d59db8c3aa899d52'
            'SKIP')

prepare() {
    cd $_pkgname-$pkgver
    patch -p 1 -i../python-flax.diff
}

build() {
    python -m build -nw $_pkgname-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir=$pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver*.whl
}
