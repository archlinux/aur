# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python2-pyvo
_pyname=${pkgbase#python2-}
pkgname=("python2-${_pyname}")
pkgver=0.9.3
pkgrel=1
pkgdesc="Astropy affiliated package for accessing Virtual Observatory data and services"
arch=('i686' 'x86_64')
url="https://pyvo.readthedocs.io/"
license=('BSD')
makedepends=('python2-setuptools' 'python2-mimeparse' 'python2-astropy-helpers')
checkdepends=('python2-pytest<3.7'
              'python2-astropy'
              'python2-contextlib2'
              'python2-requests-mock')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('1729177d138a22f10eeebbe4eb973d7e')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python2 setup.py build --use-system-libraries --offline
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python2 setup.py test
}

package_python2-pyvo() {
    depends=('python2-astropy' 'python2-requests')
    optdepends=('python-pyvo-doc: Documentation for PyVO')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
    mv ${pkgdir}/usr/bin/ex_casA_image_cat.py ${pkgdir}/usr/bin/ex_casA_image_cat2.py
    mv ${pkgdir}/usr/bin/ex_get_cutouts.py ${pkgdir}/usr/bin/ex_get_cutouts2.py
}
