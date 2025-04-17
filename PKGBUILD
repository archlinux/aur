# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Brendan Van Hook <brendan (at) vastactive (dot) com>
_pkgname=metakernel
pkgname=jupyter-$_pkgname
pkgver=0.30.3
pkgrel=2
pkgdesc="A Jupyter/IPython kernel template."
arch=(any)
url=https://github.com/Calysto/metakernel
license=(BSD-3-Clause)
depends=(
    python-ipykernel
    python-jedi
    python-jupyter_core
    python-pexpect
    python-pydot
)
makedepends=(
    python-build
    python-hatchling
    python-installer
)
source=($pkgname-$pkgver.tar.gz::https://github.com/Calysto/metakernel/archive/v$pkgver.tar.gz)
b2sums=('72b46fb8c816919ec6e83461870fe2974c595874d45c4edde1f2eb5212f626685eb7919d3e5fa5061f4474587852fa0858aabc919e7b71415d30db915804cd52')

build() {
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
