# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=corner
pkgname=python-${_pyname}-doc
pkgver=2.2.2
pkgrel=1
pkgdesc="Documentation for corner.py"
arch=(any)
url="http://corner.readthedocs.io"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'python-myst-nb' 'python-myst-parser<0.19' 'python-sphinx-book-theme' 'python-arviz')
source=("https://github.com/dfm/corner.py/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('bd28eba1431237770c512465e71bdaaa')

#prepare() {
#    cd ${srcdir}/${_pyname}.py-${pkgver}/docs
#
#    sed -i "/myst_nb/a \    \'IPython\.sphinxext\.ipython_console_highlighting\'," conf.py
#}

build() {
    cd ${srcdir}/${_pyname}.py-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}.py-${pkgver}/docs/_build

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
