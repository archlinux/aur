# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Brendan Van Hook <brendan (at) vastactive (dot) com>

_pkgname=metakernel
pkgname=jupyter-$_pkgname
pkgver=0.29.3
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
)
makedepends=('python-build' 'python-hatchling' 'python-installer')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Calysto/metakernel/archive/v${pkgver}.tar.gz")
b2sums=('92b97827bc471d6af3cc81d83215b6fe6dfdbe8b15d9c388a87b5c232c3db7facb78f07379a78f5d7a7b99fee9adeb4b9d5ab5399fa7a5edd465879db644de9e')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
