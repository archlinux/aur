# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=tweakwcs
pkgname=python-${_pyname}-doc
pkgver=0.8.9
pkgrel=1
pkgdesc="Documentation for tweakwcs"
arch=('any')
url="https://tweakwcs.readthedocs.io"
license=('BSD-3-Clause')
makedepends=("python-${_pyname}=${pkgver}"
             'python-setuptools'
             'python-sphinx-automodapi'
             'python-numpydoc'
             'python-stsci_rtd_theme'
             'texlive-latexextra')  # latex(texlive-bin), mktexfmt(texlive-basic), latex.fmt(texlive-latex), anyfontsize.sty needed
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
md5sums=('03cc17e718feed1f1f58d46a74398954')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.txt
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
