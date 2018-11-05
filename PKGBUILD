# Maintainer: Miguel de Val-Borro <miguel.deval at gmail dot com>
# Contributor: Universebenzene <universebenzene at sina dot com>
pkgname=('python-astropy-helpers')
pkgver=3.0.2
pkgrel=2
pkgdesc="Utilities used for building the Astropy python library for astronomy"
arch=('any')
url="https://github.com/astropy/astropy-helpers"
license=('BSD')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/astropy-helpers/astropy-helpers-${pkgver}.tar.gz"
        'astropy_helpers.patch')
md5sums=('0e7b7e284be43946ec74e9f3b59af726'
         'd948d609321d1bd7239be90af8e53045')

prepare() {
    cd ${srcdir}/astropy-helpers-${pkgver}

    patch -Np1 -i "${srcdir}/astropy_helpers.patch"
}

package() {
    cd ${srcdir}/astropy-helpers-${pkgver}
    install -D -m644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1 --use-system-libraries --offline
}
