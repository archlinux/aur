# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=starsessions
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=2.2.1
pkgrel=2
pkgdesc="Advanced sessions for Starlette and FastAPI frameworks."
arch=('any')
url="https://github.com/alex-oleshkevich/starsessions"
license=('MIT')
depends=('python-starlette' 'python-itsdangerous')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
optdepends=('python-redis')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-asyncio' 'mypy' 'python-fastapi' 'python-redis' 'python-httpx')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('e289e56da0c7436db6eb922374f57eaee1319b7af58ca14ba00feb447556d09f61cbe110302a9cc0ec68a15ab82f3355521790256b6e13c54f70e73b874a1009')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
