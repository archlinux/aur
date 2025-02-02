# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kipart
_name=${pkgname#python-}
pkgver=1.4.2
pkgrel=8
epoch=
pkgdesc="Generate multi-unit schematic symbols for KiCad from a CSV, text, or Excel file."
arch=('any')
url="https://pypi.org/project/kipart"
license=(MIT)
groups=()
provides=(${_name})
conflicts=(${_name})
depends=(
    python
    python-affine
    python-sexpdata
    python-openpyxl
    python-pyparsing)
makedepends=(python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('947ca5cc2c9fcb90e3b63769e0e6603c7a93d26088c30ee3496f4291e01bff7b')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    # https://wiki.archlinux.org/index.php/Python_package_guidelines
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}
