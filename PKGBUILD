# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-olxsearch
_name=${pkgname#python-}
pkgver=1.0.5
pkgrel=1

pkgdesc="Download metadata from OLX online marketplaces"
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
sha256sums=("4bef8ec88eb4416f2cfb7b64b40bf5cb0f7585ca037a988293c2d4bbb6f770d2")

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
