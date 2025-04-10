# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com"
# Contributor: Marco Rubin <marco.rubin@protonmail.com>

_name=pyquil
pkgname=python-$_name
pkgver=4.16.1 
pkgrel=1
pkgdesc='A Python library for quantum programming using Quil.'
arch=(any)
url='https://github.com/rigetti/pyquil'
license=('Apache')
depends=(
    'python>=3.8'
    python-importlib-metadata
    'python-lark-parser>=0.11.1'
    'python-networkx>=2.5'
    'python-numpy>=1.22'
    'python-packaging>=23.1'
    'python-pydantic>=1.10.7'
    'python-qcs-api-client>=0.21.0'
    python-retry
    'python-rpcq>=3.10.0'
    'python-scipy>=1.7.3'
    'python-tenacity>=8.2.2'
    'python-types-python-dateutil>=2.8.19'
    'python-types-retry>=0.9.9'
)
optdepends=(
    'ipython: latex'
    'python-sphinx: docs'
    'python-nbsphinx: docs'
    'python-recommonmark: docs'
    'quilc: local compiler server'
    'qvm: local quantum virtual machine server'
)
makedepends=(
    python-build
    python-installer
    python-poetry
    python-wheel
)
# https://github.com/rigetti/pyquil/archive/refs/tags/v4.16.1.tar.gz
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('33c2c407bc4545872fb5abbba0146745a43629cac07d85f6b979425e1f5c9c97')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
