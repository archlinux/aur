# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-orbax-checkpoint
_pkgname=${pkgname#python-}
pkgver=0.4.8
pkgrel=1
pkgdesc='Orbax provides common utility libraries for JAX users (checkpoint).'
arch=('any')
url='https://github.com/google/orbax'
license=('Apache')
groups=('jax')
depends=(
    'python-absl'
    'python-etils'
    'python-importlib_resources'  # etils[epath]
    'python-jax'
    'python-msgpack'
    'python-nest-asyncio'
    'python-numpy'
    'python-protobuf'
    'python-tensorstore'
    'python-typing_extensions'  # etils[epy]
    'python-yaml'

)
makedepends=('python-build' 'python-flit-core' 'python-installer')
optdepends=(
    'python-orbax-export: Serialization JAX to TensorFlow Saved Models.'
)
conflicts=('python-orbax')
replaces=('python-orbax')
source_hash='0aa7437041151184354e018bd30c4ca0f3cd49e8674564dc00698e9b7043'
source=("$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/91/2b/$source_hash/orbax_checkpoint-$pkgver.tar.gz")
sha256sums=('b72aacbfbd07fe767ca39ed4152118894181412e620cf283b5951c8ce1e0ea6c')

build() {
    python -m build -nw orbax_checkpoint-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        orbax_checkpoint-$pkgver/dist/orbax_checkpoint-$pkgver-*.whl
}
