# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-orbax-checkpoint
_pkgname=${pkgname#python-}
pkgver=0.6.3
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
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9663b94fd2fb0e7a13b49823ef83e4fc0bc3c399dde229ee7b6c0d8ffac6e1e6')

build() {
    python -m build -nw orbax-$pkgver/checkpoint
}

package() {
    python -m installer \
        --compile-bytecode=1 \
        --destdir=$pkgdir \
        orbax-$pkgver/checkpoint/dist/orbax_checkpoint-$pkgver-*.whl
}
