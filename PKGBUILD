# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-orbax-checkpoint
_pkgname=${pkgname#python-}
pkgver=0.8.0
pkgrel=1
pkgdesc='Orbax provides common utility libraries for JAX users (checkpoint).'
arch=('any')
url='https://github.com/google/orbax'
license=('Apache')
groups=('jax')
depends=(
    'python-absl'
    'python-etils'
    'python-humanize'
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
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e915acc966ed07bfd359d26710cd8d0eb371cfac1f96f32599f090e6bf57bc73')

build() {
    python -m build -nw orbax-$pkgver/checkpoint
}

package() {
    python -m installer \
        --compile-bytecode=1 \
        --destdir=$pkgdir \
        orbax-$pkgver/checkpoint/dist/orbax_checkpoint-$pkgver-*.whl
}
