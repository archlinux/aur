# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-ectool
_name=${pkgname#python-}
pkgver=1.2.1
pkgrel=1
epoch=
pkgdesc="A tools for EC modules, like EC618/EC616/EC718"
arch=('any')
url="https://pypi.org/project/ectool"
license=(MIT)
groups=()
provides=(${_name})
conflicts=(${_name})
depends=(python
    python-cstruct
    python-py7zr
    python-pyserial
    python-requests
)
makedepends=(python-build
    python-installer
    python-wheel
    python-setuptools)
checkdepends=(python-pytest)
options=()
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('cd528c365aee8bd3bec1fedd70642a495bf69749e435bcb70f499e6ebe6184fc')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

# check() {
#     cd ${_name}-${pkgver}
#     PYTHONPATH=src pytest tests
# }

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
