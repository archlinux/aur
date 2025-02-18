# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-orbax-export
_pkgname=${pkgname#python-}
pkgver=0.0.6
_pkgver=0.11.5
pkgrel=2
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
    'python-orbax-checkpoint'
)
makedepends=('python-build' 'python-flit-core' 'python-installer')
optdepends=(
    'python-tensorflow: Execution engine for saved models.'
)
conflicts=('python-orbax')
replaces=('python-orbax')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('37947bc16fc7d0a423fa3a4d5700d9ec9e9b886a29a23923392b691b83e38e96')

build() {
    python -m build -nw orbax-$_pkgver/export
}

package() {
    cd orbax-$_pkgver/export/
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/orbax_export-$pkgver-*.whl
    find $pkgdir -iname '*_test.py' -delete
}
