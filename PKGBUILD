# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=pyregion
pkgname=python-${_pyname}-doc
pkgver=2.3.0
pkgrel=1
pkgdesc="Documentation for Python pyregion module"
arch=('any')
url="http://pyregion.readthedocs.io"
license=('MIT')
makedepends=("python-${_pyname}=${pkgver}"
             'python-sphinx-automodapi'
             'python-sphinx_rtd_theme'
             'python-matplotlib')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('da51ec143f5bf07785eddcff0552c780')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -e '/docs.astropy.org/s#None#("http://docs.astropy.org/en/stable/", None)#' \
        -e '/python.org/s#None#("https://docs.python.org/", None)#' -i docs/conf.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
}
