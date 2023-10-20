# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=pyquil
pkgname=python-$_name
pkgver=4.0.3
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
    # 'python-sphinx-rtd-theme: docs'
    'python-nbsphinx: docs'
    'python-recommonmark: docs'
    'quilc: local compiler server'
    'qvm: local quantum virtual machine server'
)
makedepends=(python-build python-installer python-poetry python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('f65512051275edae771e0ed8b3b408284d0fc54c3d2bb48596ad0bdac9c799dd006d910751314c9a6e932e94741f52ae3409ebfe879d66c4a910ec3cd5cc3396')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
