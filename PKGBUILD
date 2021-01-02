# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=glue-core
pkgname=glueviz-doc
pkgver=1.0.0
pkgrel=1
pkgdesc="Documentation for Glue"
arch=('i686' 'x86_64')
url="http://glueviz.org"
license=('BSD')
makedepends=("python-${_pyname}=1.0.1"
             'glueviz'
             'python-bottleneck'
             'python-echo'
             'python-sphinx-automodapi'
             'python-numpydoc'
             'python-sphinxcontrib-spelling'
             'aspell'
             'hspell'
             'hunspell'
             'nuspell'
             'libvoikko')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('930953e08bec78092ba037015c84e288')

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
