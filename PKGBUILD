# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-orbax-export
_pkgname=${pkgname#python-}
pkgver=0.0.3
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
optdepends=(
    'python-tensorflow: Execution engine for saved models.'
)
source_hash='12/71/c661d9fca562fff222cc2b216697c3bee6941b2e8da04f88e19e648a7f78'
source=("$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/$source_hash/${_pkgname/-/_}-$pkgver.tar.gz")
sha256sums=('f0a8f06795457cb58eb5979a6b2f36df33a866b1b66a2361195092ce830d1eef')

build() {
    python -m build -nw ${_pkgname/-/_}-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        ${_pkgname/-/_}-$pkgver/dist/${_pkgname/-/_}-$pkgver-*.whl
    find $pkgdir -iname '*_test.py' -delete
}
