# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-biosutilities
_name=${pkgname#python-}
pkgver=25.2.23
pkgrel=1
epoch=
pkgdesc="Various BIOS Utilities for Modding/Research"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(BSD-2-Clause-Patent)
groups=()
provides=(${pkgname} ${_name})
conflicts=(${pkgname} ${_name})
depends=(
    #     7zip
    python
    python-pefile
    #     uefitool
    #AUR
    #     bgscripttool
    python-dissect.util
    #     toshibacomextractor
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
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('cda4caf7bb92f1cc1f0d610ea0e6b8b8888e32a3998a84685b44bb6b5a78c467')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
