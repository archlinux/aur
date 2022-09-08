# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-webis
_name="${pkgname#python-}"
pkgver=0.3.1
pkgrel=2

pkgdesc="Python wrapper for the webis Twitter sentiment identification tool"
url="https://gitlab.com/christoph.fink/python-webis"
license=("GPL3")

arch=("any")
makedepends=(
    "python-setuptools"
)
depends=(
    "java-environment"
    "java-runtime"
    "python-emojientities"
    "python-gitpython"
    "python-pandas"
    "python-pyjnius"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('417fd708cfbc54078e0bc678fa6c64d973a5112888c8a697931970398283f543')

prepare() {
    rm -Rf "${srcdir}/*/*.egg-info"
}

build() {
    cd "${srcdir}/webis-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/webis-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

}
