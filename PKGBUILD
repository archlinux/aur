# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=glue-qt
pkgname=glueviz-doc
pkgver=1.16.0
pkgrel=1
_glue_qt_ver=0.3.0
pkgdesc="Documentation for Glue"
arch=('any')
url="http://glueviz.org"
license=('BSD')
makedepends=("python-${_pyname}=${_glue_qt_ver}"
             'glueviz'
             'python-sphinx<7.2.2'
             'python-sphinx-automodapi'
             'python-numpydoc'
             'python-sphinxcontrib-spelling'
             'python-sphinx-book-theme'
             'qt5-svg'
             'aspell'
             'hspell'
             'hunspell'
             'nuspell'
             'libvoikko')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${_glue_qt_ver}.tar.gz")
md5sums=('975341ca7746e8c193b708ec8a579bf9')

build() {
    cd ${srcdir}/${_pyname}-${_glue_qt_ver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${_glue_qt_ver}/doc/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
