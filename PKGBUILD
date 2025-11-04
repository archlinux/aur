# Maintainer: Astro Benzene <universebenzene at sina dot com>

_pname=stsci.imagestats
_pyname=${_pname//./_}
pkgname=python-${_pname}-doc
pkgver=1.8.4
pkgrel=1
pkgdesc="Documentation for STScI Imagestats"
arch=('any')
url="https://stsciimagestats.readthedocs.io"
license=('BSD-3-Clause')
makedepends=("python-${_pname}=${pkgver}" 'python-numpydoc' 'python-sphinx_rtd_theme')
# 'python-stsci_rtd_theme')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('4c5cf2a13925e1a05ee1ebf5ff1ac5ff')

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
