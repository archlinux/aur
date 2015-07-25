# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Package Repository: https://github.com/mij-aur-packages/pyhamcrest

_pypi_pkgname=PyHamcrest
pkgbase=${_pypi_pkgname,,}
pkgname=(python{2,}-pyhamcrest)
pkgver=1.8.5
pkgrel=1
pkgdesc='A framework for writing matcher objects, allowing you to declaratively define "match" rules'
arch=('any')
url="https://github.com/hamcrest/PyHamcrest"
license=('BSD')
makedepends=(python{2,}-setuptools)
source=("https://pypi.python.org/packages/source/P/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
md5sums=('0e399d670674826c61c19d972ac9ff20')

build() {
    for pybin in python python2; do
        _dir="${srcdir}/${pybin}-${_pypi_pkgname}-${pkgver}"
        mkdir -p "${_dir}"
        cd "${_dir}"
        cp -r "${srcdir}/${_pypi_pkgname}-${pkgver}"/. .
        ${pybin} setup.py build
    done
}

_package() {
    pybin=$1
    depends=(${pybin})
    cd "${srcdir}/${pybin}-${_pypi_pkgname}-${pkgver}"
    ${pybin} setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

for _name in "${pkgname[@]}"; do
    _splitname=(${_name//-/ }) # For retriving the python version needed
    eval "package_${_name}() { _package ${_splitname[0]}; }"
done
