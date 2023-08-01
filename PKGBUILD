# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
# Maintainer: Daniel Bershatsky <d.bershatsky2@skoltech.ru> (aur.archlinux.org/account/daskol)
pkgname=python-flax
_pkgname=${pkgname#python-}
pkgver=0.7.1
pkgrel=5
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
# Maintainers change release tag. Yes, I know. ¯\_(ツ)_/¯
# source=("flax-$pkgver.tar.gz::https://github.com/google/flax/archive/refs/tags/v${pkgver}.tar.gz")
source=("flax-$pkgver.tar.gz::https://files.pythonhosted.org/packages/20/53/42a39b67d98390798bdc5e8f17015b315a9c00129bce3a8de6b629b10c5d/flax-0.7.1.tar.gz")
sha256sums=('20b2f92971101be5214689d6f035ee1e7fde55e4d079ee23086b5682bac2cbf4')

build() {
    python -m build -nw $_pkgname-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir=$pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver*.whl
}
