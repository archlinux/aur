# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
# Maintainer: Daniel Bershatsky <d.bershatsky2@skoltech.ru> (aur.archlinux.org/account/daskol)
pkgname=python-flax
_pkgname=${pkgname#python-}
pkgver=0.7.1
pkgrel=4
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
_commit=675e34da03cf5eccd4325af8c558cec1bb1d6be8
source=("flax-$pkgver.tar.gz::https://github.com/google/flax/archive/$_commit.tar.gz")
sha256sums=('cf2b2a965208b7d204c36b5b35cf494bc9d7b1d3d67046bb056ffc2f543a974f')

prepare() {
    ln -s flax-$_commit flax-$pkgver
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
