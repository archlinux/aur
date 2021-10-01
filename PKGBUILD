# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=drizzlepac
pkgname=python-${_pyname}-doc
pkgver=3.3.0
pkgrel=1
pkgdesc="Documentation for DrizzlePac"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/scientific-community/software/drizzlepac.html"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}"
             'graphviz'
             'python-numpydoc'
             'python-sphinx_rtd_theme'
             'python-astroquery'
             'python-photutils'
             'python-pandas'
             'python-stsci_rtd_theme'
             'python-sphinx-automodapi'
             'python-ci_watson'
             'texlive-latexextra'
             'python-bokeh'
             'python-scikit-image'
             'python-pypdf2')
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz"
        'fix_changelog_title-3.3.0.patch'
        'fix_changelog_indent.patch')
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
md5sums=('d75d47674b39894b6387de7671e8a9bc'
         'cc5c4f5b71429895ac093c39e66af232'
         'd466b6dc479df8144ce13dacf5081d44')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix_changelog_title-3.3.0.patch"
    patch -Np1 -i "${srcdir}/fix_changelog_indent.patch"
#   sed -i 's/stylesheet/css_file/' doc/source/conf.py
    mv ${_pyname} _${_pyname}
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.txt
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
