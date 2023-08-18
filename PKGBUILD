# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=glue-qt
pkgname=glueviz-doc
pkgver=1.12.0
pkgrel=2
_glue_qt_ver=0.1.0
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
             'python-sphinx_rtd_theme'
             'aspell'
             'hspell'
             'hunspell'
             'nuspell'
             'libvoikko')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${_glue_qt_ver}.tar.gz")
md5sums=('454d655ff8a1e88c53aae4b4db6c9359')

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
