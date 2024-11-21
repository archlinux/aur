# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=aiohasupervisor
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.2.1
pkgrel=1
pkgdesc="Asynchronous python client for Home Assistant Supervisor."
arch=('any')
url="https://github.com/home-assistant-libs/python-supervisor-client"
license=("Apache-2.0")
depends=(python-aiohttp python-mashumaro python-orjson python-yarl)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('a1242165fd255796c961dadfbb88fc1f0d45f8441f8af10f42899ab478b1cbd9')

prepare() {
    cd "${_pipname}-${pkgver}"
    sed -e "s|setuptools~=[^\"]\+|setuptools|" \
        -e "s|wheel~=[^\"]\+|wheel|" \
        -i pyproject.toml
}

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
