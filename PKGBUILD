# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=rank-bm25
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.2.2
pkgrel=1
pkgdesc="Various BM25 algorithms for document ranking"
arch=('any')
url="https://github.com/dorianbrown/${_pipname}"
license=('Apache-2.0')
depends=("python-numpy")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz"
        "version-${pkgver}.py::${url}/raw/refs/tags/${pkgver}/version.py")
sha256sums=('096ccef76f8188563419aaf384a02f0ea459503fdf77901378d4fd9d87e5e51d'
            'c98ea549a508952b84f6dc8153aa143944661fe45ade8b58eb59516f04d59704')

build() {
    cd "${_pipname}-${pkgver}"
    cp -f .."/version-${pkgver}.py" version.py
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
