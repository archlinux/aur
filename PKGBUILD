# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-orbax-checkpoint
_pkgname=${pkgname#python-}
pkgver=0.11.4
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
sha256sums=('b4be40c6ac92ffc95bfdb4ffe9f280027f240162d445c7fa209c2a75bcc25e24')

build() {
    python -m build -nw orbax-$pkgver/checkpoint
}

package() {
    python -m installer \
        --compile-bytecode=1 \
        --destdir=$pkgdir \
        orbax-$pkgver/checkpoint/dist/orbax_checkpoint-$pkgver-*.whl
}
