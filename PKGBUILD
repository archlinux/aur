# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-flax
_name=${pkgname#python-}
pkgver=0.6.10
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
sha256sums=('e2174a0df7bb4921f29b2cbd33f55ddf6eed161d6df61809fe374a25e473fb2f')

build() {
    python -m build -nw $_name-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir=$pkgdir \
        $_name-$pkgver/dist/*.whl
}

