# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=drizzlepac
pkgname=python-${_pyname}-doc
pkgver=3.0.5
pkgrel=1
pkgdesc="Documentation for DrizzlePac"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/scientific-community/software/drizzlepac.html"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'graphviz' 'python-numpydoc' 'python-sphinx_rtd_theme' 'python-stsci_rtd_theme' 'python-sphinx-automodapi' 'python-ci_watson' 'texlive-latexextra')
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
#        "https://raw.githubusercontent.com/spacetelescope/drizzlepac/master/LICENSE.txt"
#        "https://raw.githubusercontent.com/spacetelescope/drizzlepac/master/CHANGELOG.rst")
md5sums=('00abb7bb702aca33142725fbc8976adc')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mv ${_pyname} _${_pyname}
#   ln -rs ${srcdir}/{LICENSE.txt,CHANGELOG.rst} .
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
