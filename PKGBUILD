# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-orbax-export
_pkgname=${pkgname#python-}
pkgver=0.0.2
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
    'python-numpy'
    'python-orbax-checkpoint'
    'python-typing_extensions'  # etils[epy]
    'python-yaml'
)
makedepends=('python-build' 'python-flit-core' 'python-installer')
source=("$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/86/89/3a6034ff3ee377fc67e58270b86afefb5a91d21595d3c99d10e668ac289a/$_pkgname-$pkgver.tar.gz")
sha256sums=('dd7e218a43b94b0495113b41d805f0c3fe53587ba26fe46bd13e72add7be0a40')

build() {
    python -m build -nw $_pkgname-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/dist/orbax_export-$pkgver-*.whl
    find $pkgdir -iname '*_test.py' -delete
}
