# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=ginga
pkgname=python-${_pyname}-doc
pkgver=4.0.1
pkgrel=1
pkgdesc="Documentation for Ginga"
arch=('any')
url="https://ejeschke.github.io/ginga/"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}"
             'python-sphinx-astropy'
             'python-sphinx_rtd_theme'
             'graphviz')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#source=("https://github.com/ejeschke/ginga/archive/v${pkgver}.tar.gz")
md5sums=('4fb8b5ba37dbf9fa52f57da0fe4fdd96')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../{LICENSE.txt,licenses/*}
}
