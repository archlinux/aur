# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-biosutilities
_name=${pkgname#python-}
pkgver=25.7.1
pkgrel=5
epoch=
pkgdesc="Various BIOS Utilities for Modding/Research"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(BSD-2-Clause-Patent)
groups=()
provides=(${pkgname} ${_name})
conflicts=(${pkgname} ${_name})
depends=(
    python
    python-pefile
    #AUR
    python-dissect.util
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=(
    '7zip: File archiver for extremely high compression'
    'uefitool: UEFI firmware image viewer and editor and utilities'
    'bgscripttool: Intel BIOS Guard Script Tool'
    'toshibacomextractor: Quick and dirty tool to extract Toshiba .COM firmware files, released so it does not get lost.'
)
options=('!strip' '!debug')
source=(
    "${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
noextract=()
sha256sums=('d7ecce1cf8c9cff5ed391cbee4ccc70a86ae5f9213e406815121be417ff2cd8d')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
