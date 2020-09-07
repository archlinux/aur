# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-olxsearch
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=0

pkgdesc="Download metadata from the OLX online market place(s)"
url="https://gitlab.com/christoph.fink/olxsearch"
license=("GPLv3")

arch=("any")
makedepends=("python-setuptools")
checkdepends=("python-nose")
depends=(
    "python-beautifulsoup4"
    "python-dateparser"
    "python-fake-useragent"
    "python-geocoder"
    "python-pandas"
    "python-psycopg2"
    "python-requests"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("37fc04450cd8d86180d4bd42eb3eb0bc1864f07e684e6955af8a1ee24cdaeafe")

prepare() {
   rm -Rf "${srcdir}/*/*.egg-info"
}

build() {
   cd "${srcdir}/${_name}-${pkgver}"
   python setup.py build
}

check() {
    cd "${srcdir}/${_name}-${pkgver}/test/"
    nosetests -sx
}

package() {
   cd "${srcdir}/${_name}-${pkgver}"
   python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
