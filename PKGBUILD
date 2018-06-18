# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-astropy-doc
pkgver=3.0.3
pkgrel=1
pkgdesc="Documentation for AstroPy"
arch=('i686' 'x86_64')
url="http://www.astropy.org"
license=('BSD')
makedepends=('python-yaml' 'python-pillow' 'python-astropy' 'python-astropy-helpers' 'graphviz' 'python-scikit-image' 'python-pytest' 'python-sphinx-gallery')
source=("https://files.pythonhosted.org/packages/source/a/astropy/astropy-${pkgver}.tar.gz")
md5sums=('f6fe7d5049fc0d7c7132e7ff54a8111e')

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
}
