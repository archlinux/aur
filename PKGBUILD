# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=pyquil
pkgname=python-$_name
pkgver=3.3.4
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
b2sums=('18f4c3b2e0dfe334ab62b61b1ad813845ed757d49d0ca73fe780624128f33feb5c5e23e97645e287e34dffec32f0cc599317b943f0ae025ecb2f555d122d8d88')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
