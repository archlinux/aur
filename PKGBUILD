# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-flax
_name=${pkgname#python-}
pkgver=0.6.5
pkgrel=1
pkgdesc='A neural network library and ecosystem for JAX designed for flexibility'
arch=('any')
url='https://github.com/google/flax'
license=('Apache')
groups=('jax')
depends=(
    'python-jax'
    'python-matplotlib'
    'python-msgpack'
    'python-numpy'
    'python-optax'
    'python-pyyaml'
    'python-rich'
    'python-tensorstore'
    'python-typing_extensions'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
    'python-orbax: Checkpointing routines for JAX.'
    'tensorboard: TensorBoard visualization and logging.'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('12b921fe16198767d0b662a55024b698f6670b311463fa09d39194661fed1b24')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --compile-bytecode 1 --destdir="$pkgdir" dist/*.whl
}

