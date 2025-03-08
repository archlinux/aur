# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-orbax-checkpoint
_pkgname=${pkgname#python-}
pkgver=0.11.7
pkgrel=1
pkgdesc='Common utility libraries for JAX users (checkpoint).'
arch=('any')
url='https://github.com/google/orbax'
license=('Apache-2.0')
groups=('jax')
depends=(
    'python-absl'
    'python-etils'
    'python-humanize'
    'python-jax>=0.5.0'
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
sha256sums=('6c490b95b55d7ca62a8dc0b215ff608fc8b81efafe6cad3a3b7f8b4f8ea5f9d5')

build() {
    python -m build -nw orbax-$pkgver/checkpoint
}

package() {
    cd orbax-$pkgver
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        checkpoint/dist/orbax_checkpoint-$pkgver-*.whl
}
