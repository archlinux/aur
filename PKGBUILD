# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=pyquil
pkgname=python-$_name
pkgver=3.3.2
pkgrel=2
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
b2sums=('caa4b7ddef768999402e059f935bade5cede209475c75de02ef25a9af0661f0644ec1e44be83957888b2ca9161a09d9da4d61e8c81e426885141dfaec851f4a3')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
