# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-astropy-doc
pkgver=3.1
pkgrel=1
pkgdesc="Documentation for AstroPy"
arch=('i686' 'x86_64')
url="http://www.astropy.org"
license=('BSD')
makedepends=('python-yaml' 'python-pillow' 'python-astropy' 'python-astropy-helpers>=3.1' 'graphviz' 'python-scikit-image' 'python-pytest' 'python-sphinx-astropy')
source=("https://files.pythonhosted.org/packages/source/a/astropy/astropy-${pkgver}.tar.gz")
md5sums=('fb662a7a8ab3bf47b74d6feb2ffca1e0')

prepare() {
    cd ${srcdir}/astropy-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/astropy-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/astropy-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/python-astropy"
    cp -a html "${pkgdir}/usr/share/doc/python-astropy"
    install -m644 -t "${pkgdir}/usr/share/doc/python-astropy/html/_static" ../_static/*
    install -m644 -t "${pkgdir}/usr/share/doc/python-astropy/html/_images" ../_static/*
}
