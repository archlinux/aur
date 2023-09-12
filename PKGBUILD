# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Brendan Van Hook <brendan (at) vastactive (dot) com>
_pkgname=metakernel
pkgname=jupyter-$_pkgname
pkgver=0.30.1
pkgrel=1
pkgdesc="A Jupyter/IPython kernel template."
arch=('any')
url="https://github.com/Calysto/metakernel"
license=('BSD')
depends=(
    'python-ipykernel'
    'python-jedi'
    'python-jupyter_core'
    'python-pexpect'
    'python-pydot'
)
makedepends=('python-build' 'python-hatchling' 'python-installer')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Calysto/metakernel/archive/v${pkgver}.tar.gz")
b2sums=('eaf674270fb580a87c88f4d2bd2a043a24d624e47d08fe51631b81a9db0548455d1e04efe550c6535d16b6abd1bd87fa71521c9ad80d6344792719ebd4b6327c')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
