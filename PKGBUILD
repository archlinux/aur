# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=tweakwcs
pkgname=python-${_pyname}-doc
pkgver=0.8.0
pkgrel=1
pkgdesc="Documentation for tweakwcs"
arch=('any')
url="https://tweakwcs.readthedocs.io"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}"
             'python-setuptools'
             'python-numpydoc'
#            'python-sphinx_rtd_theme'
             'python-stsci_rtd_theme'
             'texlive-latexextra'
             )
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
md5sums=('44ad334013b6251cb0dd500f5f06fc04')

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
