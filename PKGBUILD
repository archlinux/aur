# Maintainer: Rafael Silva <perigoso@riseup.net>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=easyeda2kicad
_name=${pkgname}
pkgver=0.8.0
pkgrel=0
pkgdesc="Convert any LCSC components (including EasyEDA) to KiCad library"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://pypi.org/project/easyeda2kicad"
_pydeps=(
    requests
    pydantic)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
license=('AGPL-3.0-or-later')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a781be6d1076f6e06886a4292373eb930c9921de4c709d6dd91bb6ea104f4a4b')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
