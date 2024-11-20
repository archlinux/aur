# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=eval-type-backport
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.2.0
pkgrel=1
pkgdesc="Like typing._eval_type, but lets older Python versions use newer typing features."
arch=("any")
url="https://github.com/alexmojaki/${_pipname}"
license=('MIT')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('68796cfbc7371ebf923f03bdf7bef415f3ec098aeced24e054b253a0e78f7b37')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
