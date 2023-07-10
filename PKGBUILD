# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=glue-core
pkgname=glueviz-doc
pkgver=1.12.0
pkgrel=1
pkgdesc="Documentation for Glue"
arch=('any')
url="http://glueviz.org"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}"
             'glueviz'
             'python-sphinx-automodapi'
             'python-numpydoc'
             'python-sphinxcontrib-spelling'
             'aspell'
             'hspell'
             'hunspell'
             'nuspell'
             'libvoikko')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('2f82afa05d582e5f552a25c4b740cdd0')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
