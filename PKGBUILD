# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=pyquil
pkgname=python-$_name
pkgver=3.5.4
pkgrel=1
pkgdesc='A Python library for quantum programming using Quil.'
arch=(any)
url='https://github.com/rigetti/pyquil'
license=('Apache')
depends=(
    'python>=3.7'
    python-importlib-metadata
    'python-lark-parser>=0.11.1'
    python-networkx
    'python-numpy>=1.21'
    'python-qcs-api-client>=0.21.0'
    python-retry
    'python-rpcq>=3.10.0'
    'python-scipy>=1.6.1'
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
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('09851379ef69ccc2643c3e042787ee81a75b35d2905182c67f7ac8309e189b1c1dd100b5c11aad81de2eee18a830db479fa984afda441134612ade3592165f89')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
