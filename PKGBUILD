# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=glue-qt
pkgname=glueviz-doc
pkgver=1.16.0
pkgrel=1
_glue_qt_ver=0.3.1
pkgdesc="Documentation for Glue"
arch=('any')
url="http://glueviz.org"
license=('BSD-3-Clause')
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
md5sums=('ddb96f5d8ba79860c0f13302d93d1708')

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
