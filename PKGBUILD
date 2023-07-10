# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
# Maintainer: Daniel Bershatsky <d.bershatsky2@skoltech.ru> (aur.archlinux.org/account/daskol)
pkgname=python-flax
_name=${pkgname#python-}
pkgver=0.7.0
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('171715d7df050eb748867f14a6d42338adba060edaa1e3b4d3e978a3483db8c5')

build() {
    python -m build -nw $_name-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir=$pkgdir \
        $_name-$pkgver/dist/*.whl
}

