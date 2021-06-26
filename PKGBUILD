# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=emcee
pkgname=python-${_pyname}-doc
pkgver=3.1.0
pkgrel=1
pkgdesc="Documentation for Python emcee"
arch=('i686' 'x86_64')
url="http://emcee.readthedocs.io"
license=('MIT')
makedepends=("python-${_pyname}=${pkgver}" 'python-sphinx' 'python-sphinx_rtd_theme' 'jupyter-nbconvert' 'pandoc' 'texlive-core' 'texlive-science' 'python-myst-nb' 'python-sphinx-book-theme')
source=("https://github.com/dfm/emcee/archive/v${pkgver}.tar.gz")
#       'fix_testimonials_duplicate.patch')
md5sums=('e023d2b76790f73d6c9c7f54b485a6ec')
#        '5e88556560ab075f8331465012b8286a')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    patch -Np1 -i "${srcdir}/fix_testimonials_duplicate.patch"
#}

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
