# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=pyquil
pkgname=python-$_name
pkgver=3.5.0
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
b2sums=('9e8bf33810cc89ca80681d5850999137a9727621897692a6092d207747272ff6fe1f5ef3bdc8a27261e4cf23c7f14461971937a6348004a9d14051fec9089b32')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
