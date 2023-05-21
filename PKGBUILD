# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=pyquil
pkgname=python-$_name
pkgver=3.5.1
pkgrel=1
pkgdesc='A Python library for quantum programming using Quil.'
arch=(any)
url='https://github.com/rigetti/pyquil'
license=('Apache')
depends=(
    python
    python-importlib-metadata
    python-lark-parser
    python-networkx
    python-numpy
    python-qcs-api-client
    python-retry
    python-rpcq
    python-scipy
    python-types-retry
)
optdepends=(
    'ipython: latex'
    'python-sphinx: docs'
    # 'python-sphinx-rtd-theme: docs'
    'python-nbsphinx: docs'
    'python-recommonmark: docs'
    'quilc: local compiler server'
    'qvm: local quantum virtual machine server'
)
makedepends=(python-build python-installer python-poetry python-wheel)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('a26b08917cc55672ff546c8be02527c3b879650c4cc61680bbfba47dc51535065c361a669ca99b2bcebfe166ddcf6a48c2d0b93ad7cbc3f9697ddde7e4687b11')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
