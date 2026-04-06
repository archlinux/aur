# Maintainer: taotieren <admin@taotieren.com>

pkgname=easyeda2kicad
_name=${pkgname}
pkgver=1.0.1
pkgrel=1
pkgdesc="A Python script that convert any electronic components from LCSC or EasyEDA to a Kicad library"
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
sha256sums=('122a48fafa3b918e730185c973dd342183928b8a0dbe24436d13d58b90290e84')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
