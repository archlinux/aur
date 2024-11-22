# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-orbax-export
_pkgname=${pkgname#python-}
pkgver=0.0.6
_pkgver=0.10.0
pkgrel=1
pkgdesc='Orbax provides common utility libraries for JAX users (export).'
arch=('any')
url='https://github.com/google/orbax'
license=('Apache')
groups=('jax')
depends=(
    'python-absl'
    'python-dataclasses-json'
    'python-etils'
    'python-jax'
    'python-jaxtyping'
    'python-numpy'
    'python-yaml'
)
makedepends=('python-build' 'python-flit-core' 'python-installer')
optdepends=(
    'python-tensorflow: Execution engine for saved models.'
)
conflicts=('python-orbax')
replaces=('python-orbax')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('fe5ab7eb72dff38f3639750892a2d69220a34822372b910b51bf672157145fc5')

build() {
    python -m build -nw orbax-$_pkgver/export
}

package() {
    python -m installer \
        --compile-bytecode=1 \
        --destdir=$pkgdir \
        orbax-$_pkgver/export/dist/orbax_export-$pkgver-*.whl
    find $pkgdir -iname '*_test.py' -delete
}
