# Maintainer: Liam Timms <timms5000@gmail.com>

pkgname=python-dicom_parser
_pypiname=${pkgname/python-/}
pkgver=1.2.3
pkgrel=1
pkgdesc="A library for W3C Provenance Data Model supporting PROV-JSON, PROV-XML and PROV-O RDF"
arch=('any')
url='https://pypi.python.org/pypi/prov/'
license=('MIT')
optdepends=('python-pandas')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
# source=("${pkgname}::git+https://github.com/open-dicom/${_pypiname}.git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/open-dicom/${_pypiname}/archive/v${pkgver}.tar.gz")
sha256sums=('0d01fb652f4ec9e23b2de6a1bfbf1ab7f6c969cfad9b063bc4062b3e612c6866')
# sha1sums=('SKIP')

# pkgver() {
#   cd "${srcdir}/${pkgname}"
#   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
# }


build() {

    cd $srcdir/${_pypiname}-${pkgver}
    # python setup.py build
    python -m build --wheel --no-isolation
}

# check() {
#
#     cd $srcdir/${_pypiname}-${pkgver}
#     make test
# }

package() {

    # cd $srcdir/${pkgname}
    cd $srcdir/${_pypiname}-${pkgver}
    # python setup.py install --root="${pkgdir}/" --optimize=1
    python -m installer --destdir="$pkgdir" dist/*.whl

}

