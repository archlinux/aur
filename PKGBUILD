# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-olxsearch
_name=${pkgname#python-}
pkgver=1.0.4
pkgrel=1

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
    "python-geoalchemy2"
    "python-geocoder"
    "python-pandas"
    "python-sqlalchemy"
    "python-requests"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("ed19ee86971fc8b577ce78dd2965d386b33550a6b2631e6c17a307e4c8f2a304")

prepare() {
   rm -Rf "${srcdir}/*/*.egg-info"
}

build() {
   cd "${srcdir}/${_name}-${pkgver}"
   python -c "from setuptools import setup; setup();" build
}

check() {
    cd "${srcdir}/${_name}-${pkgver}/test/"
    nosetests -sx
}

package() {
   cd "${srcdir}/${_name}-${pkgver}"
   python -c "from setuptools import setup; setup();" install --root="${pkgdir}" --optimize=1 --skip-build
}
