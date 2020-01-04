# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-gwcs
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.12.0
pkgrel=1
pkgdesc="A python package for managing the World Coordinate System (WCS) of astronomical data"
arch=('i686' 'x86_64')
url="http://gwcs.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools')
checkdepends=('python-pytest-doctestplus' 'python-asdf' 'python-astropy>=4.0')
#'python-pytest-astropy'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('a7d3232a707c4705b1b498c1861aacf2')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
#   pytest
}

package_python-gwcs() {
    depends=('python>=3.6' 'python-astropy>=4.0' 'python-asdf')
    optdepends=('python-gwcs-doc: Documentation for Python-GWCS')
#               'python-pytest-astropy: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
