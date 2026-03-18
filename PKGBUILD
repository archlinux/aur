# Maintainer: Davide Gerhard <rainbow AT irh.it>

pkgname='python-citifile'
pkgver='0.1.6'
pkgrel=1
_module='CITIfile'
_src_folder="citifile-${pkgver}"
pkgdesc="To parse CITI format file to xarray."
url="https://github.com/TitorX/CITIfile"
depends=('python' 'python-xarray')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/75/b7/b369723e805e12b0ed921ada0d94589d13281f6e3052c279a6ceae788bde/citifile-${pkgver}.tar.gz")
sha256sums=('e374a86a24dd4eaf81ee7707ee0c3bab08f910e45a896a4208d773776a0ec5c1')

build() {
    cd "${srcdir}/${_src_folder}"
    sed -i 's/requirements.txt/CITIfile.egg-info\/requires.txt/' setup.py
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
