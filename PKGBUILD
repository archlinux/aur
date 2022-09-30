# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=emcee
pkgname=python-${_pyname}-doc
pkgver=3.1.3
pkgrel=1
pkgdesc="Documentation for Python emcee"
arch=('any')
url="http://emcee.readthedocs.io"
license=('MIT')
makedepends=("python-${_pyname}=${pkgver}"
             'python-sphinx'
             'python-setuptools'
             'python-myst-nb'
             'python-sphinx-book-theme'
#            'python-sphinx_rtd_theme'
#            'jupyter-nbconvert'
#            'pandoc'
             'texlive-core'
             'texlive-science')
#            'python-matplotlib'
#            'python-celerite')
source=("https://github.com/dfm/emcee/archive/v${pkgver}.tar.gz")
md5sums=('c0e7c64408c80180a02543b813667a99')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    make html

    cd ${srcdir}/${_pyname}-${pkgver}/document
    make
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a _build/html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a _static "${pkgdir}/usr/share/doc/${pkgname%-doc}"

    cd ${srcdir}/${_pyname}-${pkgver}/document
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname%-doc}/document" ms.pdf
    cp -a plots "${pkgdir}/usr/share/doc/${pkgname%-doc}/document"

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../LICENSE
}
