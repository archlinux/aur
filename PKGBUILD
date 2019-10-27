# Maintainer: Miguel de Val-Borro <miguel.deval at gmail dot com>
# Contributor: Universebenzene <universebenzene at sina dot com>
pkgname=('python-astropy-helpers')
pkgver=3.2.2
pkgrel=1
pkgdesc="Utilities used for building the Astropy python library for astronomy"
arch=('any')
url="https://astropy-helpers.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/astropy-helpers/astropy-helpers-${pkgver}.tar.gz"
        'use_system_astropy_helpers.patch')
md5sums=('8e6cee4698f0fe3382e2eb3368d62114'
         '13cd66eec7da36e18d5db09fe9dfd3a5')

prepare() {
    cd ${srcdir}/astropy-helpers-${pkgver}

    patch -Np1 -i "${srcdir}/use_system_astropy_helpers.patch"
}

package() {
    optdepends=("python-astropy-helpers-doc=${pkgver}: Documentation for Astropy helpers")
    cd ${srcdir}/astropy-helpers-${pkgver}
    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
