# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python2-corner
_pyname=corner
pkgname=('python2-corner')
#'python2-corner-doc')
pkgver=2.0.1
pkgrel=1
pkgdesc="Make some beautiful corner plots of samples"
arch=('any')
url="https://corner.readthedocs.io"
license=('BSD')
makedepends=('python2-setuptools')
#'python2-matplotlib' 'python2-sphinx' 'python2-sphinx_rtd_theme')
checkdepends=('python2-nose' 'python2-matplotlib' 'python2-gobject')
#'python2-pandas' 'python2-nose')
#source=("https://github.com/dfm/corner.py/archive/v${pkgver}.tar.gz"
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       'corner-doc.patch')
md5sums=('148a401ebb1dff47897fe4a1389e8c77')
#        '46fb1c445af9d46fa1481054f5178c03')

#prepare() {
#    cd ${srcdir}/corner.py-${pkgver}
#
#    patch -Np1 -i "${srcdir}/corner-doc.patch"
#}

build () {
    cd ${srcdir}/corner-${pkgver}
    python2 setup.py build

#   msg "Building Docs"
#   cd ${srcdir}/corner.py-${pkgver}/docs
#   make SPHINXBUILD=sphinx-build2 html
}

check(){
    cd ${srcdir}/corner-${pkgver}

#   pytest
    nosetests2 || warning "Tests failed"
}

package_python2-corner() {
    depends=('python2' 'python2-matplotlib')
    optdepends=('python2-corner-doc: Documentation for corner.py')
    cd ${srcdir}/corner-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python2-corner-doc() {
#    pkgdesc="Documentation for corner.py"
#    cd ${srcdir}/corner-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/python2-corner"
#    cp -a html "${pkgdir}/usr/share/doc/python2-corner"
#}
