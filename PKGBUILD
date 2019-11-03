# Maintainer: Miguel de Val-Borro <miguel dot deval at gmail dot com>
pkgname=python-sbpy
_pyname=${pkgname#python-}
pkgver=0.2
pkgrel=2
pkgdesc="A Python package for small bodies research"
arch=('i686' 'x86_64')
url="http://sbpy.readthedocs.io/"
license=('BSD')
makedepends=('python-astropy-helpers')
depends=('python' 'python-numpy' 'python-astropy>=1.0')
optdepends=('python-scipy' 'python-matplotlib' 'python-astroquery' 'python-pysynphot' 'python-sbpy-doc')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('6421c7c58dc473974d1aaf11441a6032')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build --use-system-libraries --offline
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}
