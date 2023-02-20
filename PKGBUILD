# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-orbax
_pkgname=${pkgname#python-}
pkgver=0.1.1
pkgrel=1
pkgdesc='Orbax is a library providing common utilities for JAX users.'
arch=('any')
url='https://github.com/google/orbax'
license=('Apache')
groups=('jax')
depends=(
    'python-absl'
    'python-cached-property'
    'python-etils'
    'python-flax'
    'python-importlib_resources'
    'python-jax'
    'python-numpy'
    'python-pyyaml'
    'python-tensorstore'
)
makedepends=('python-build' 'python-flit-core' 'python-installer')
optdepends=('python-flax: Deep learning library from Google')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6b4abf572c0f049ba346c052441c73d0fe0dae25e7631b2d02b360376d736660')

build() {
    find $_pkgname-$pkgver/$_pkgname -iname '*.md' -delete
    find $_pkgname-$pkgver/$_pkgname -iname '*.ipynb' -delete
    find $_pkgname-$pkgver/$_pkgname -iname '*_test.py' -delete
    python -m build -n -w $_pkgname-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver-*.whl
}
