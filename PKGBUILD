# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python2-astropy-doc
pkgver=2.0.7
pkgrel=1
pkgdesc="Documentation for AstroPy"
arch=('i686' 'x86_64')
url="http://www.astropy.org"
license=('BSD')
makedepends=('python2-yaml' 'python2-pillow' 'python2-astropy' 'python2-astropy-helpers' 'graphviz' 'python2-scikit-image' 'python2-pytest' 'python2-sphinx-gallery')
source=("https://files.pythonhosted.org/packages/source/a/astropy/astropy-${pkgver}.tar.gz")
md5sums=('044da9f6aba1dac3864a5ab95c9c11d0')

prepare() {
    cd ${srcdir}/astropy-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/astropy-${pkgver}/docs

    make SPHINXBUILD=sphinx-build2 html
}

package() {
    cd ${srcdir}/astropy-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/python2-astropy"
    cp -a html "${pkgdir}/usr/share/doc/python2-astropy"
}
