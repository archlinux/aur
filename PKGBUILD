# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=astropy
pkgname=python-${_pyname}-doc
pkgver=3.2.3
pkgrel=1
pkgdesc="Documentation for AstroPy"
arch=('i686' 'x86_64')
url="http://www.astropy.org"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'python-yaml' 'python-pillow' 'python-astropy-helpers>=3.1' 'graphviz' 'python-scikit-image' 'python-pytest' 'python-sphinx-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('89f6e2b419e2eec93c8e715015d5ecf5')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
    install -m644 -t "${pkgdir}/usr/share/doc/${pkgname%-doc}/html/_static" ../_static/*
    install -m644 -t "${pkgdir}/usr/share/doc/${pkgname%-doc}/html/_images" ../_static/*
}
