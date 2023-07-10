# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-orbax-checkpoint
_pkgname=${pkgname#python-}
pkgver=0.2.7
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
optdeps=(
    'python-orbax-export: Serialization JAX to TensorFlow Saved Models.'
)
makedepends=('python-build' 'python-flit-core' 'python-installer')
source_hash='b298330f736a8e0d03d7fd6056c7981bfef9ea743ebad2cc4a8b5f0811de'
source=("orbax-checkpoint-$pkgver.tar.gz::https://files.pythonhosted.org/packages/58/27/$source_hash/orbax_checkpoint-0.2.7.tar.gz")
sha256sums=('8f23a301641ec33ea094c756629855daccab263e114c6f27cebcf6c4e3f0e90e')

build() {
    python -m build -n -w orbax_checkpoint-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        orbax_checkpoint-$pkgver/dist/orbax_checkpoint-$pkgver-*.whl
}
