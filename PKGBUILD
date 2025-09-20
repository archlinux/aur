# Maintainer: Astro Benzene <universebenzene at sina dot com>

_pyname=gwcs
pkgname=python-${_pyname}-doc
pkgver=0.26.0
pkgrel=1
pkgdesc="Documentation for Python GWCS module"
arch=('any')
url="http://gwcs.readthedocs.io"
license=('BSD-3-Clause')
makedepends=("python-${_pyname}=${pkgver}"
             'python-sphinx-astropy'
             'python-sphinx-asdf'
             'python-sphinx-copybutton'
             'python-sphinx-furo'
             'python-sphinx-tabs'
#            'python-setuptools'
             'python-matplotlib'
             'graphviz')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('4ef4873b4c400a4d817682cec829ee34')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
}
