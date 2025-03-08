# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-orbax-checkpoint
_pkgname=${pkgname#python-}
pkgver=0.11.8
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
sha256sums=('4ff335358104e4ed59a79841e70c62164452eca567342d99ddde9b306744d507')

build() {
    python -m build -nw orbax-$pkgver/checkpoint
}

package() {
    cd orbax-$pkgver
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        checkpoint/dist/orbax_checkpoint-$pkgver-*.whl
}
