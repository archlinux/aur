# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=drizzlepac
pkgname=python-${_pyname}-doc
pkgver=3.6.2
pkgrel=1
pkgdesc="Documentation for DrizzlePac"
arch=('any')
url="http://www.stsci.edu/scientific-community/software/drizzlepac.html"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}"
             'graphviz'
             'python-numpydoc'
             'python-sphinx_rtd_theme'
#            'python-astroquery'
#            'python-photutils'
#            'python-pandas'
#            'python-stsci_rtd_theme'
             'python-sphinx-automodapi'
#            'python-ci_watson'
             'texlive-latexextra')  # anyfontsize.sty
#            'python-bokeh'
#            'python-scikit-image'
#            'python-pypdf2'
#            'python-astrocut'
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz"
#       "https://raw.githubusercontent.com/spacetelescope/drizzlepac/master/doc/source/SkyCell14_14.png"
#       "https://raw.githubusercontent.com/spacetelescope/drizzlepac/master/doc/source/SkyCell14_15.png"
#       "https://raw.githubusercontent.com/spacetelescope/drizzlepac/master/doc/source/SkyCellCombo.png"
#       "https://raw.githubusercontent.com/spacetelescope/drizzlepac/master/doc/source/ZoomSkyCellCombo.png"
        'fix_catalog_generation_title_level.patch')
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
md5sums=('35e99ac2acfbb55984302521ca6eef0d'
         'eb046975b52452d799021218eb414cfb')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#    patch -Np1 -i "${srcdir}/fix_catalog_generation_title_level.patch"
#    sed "/generate_custom_svm_param_file/s/generate_custom_svm_param_file/generate_custom_svm_mvm_param_file/" \
#        -i doc/source/catalog_generation.rst
#    mv ${_pyname} _${_pyname}
##   ln -s ${srcdir}/*.png ${srcdir}/${_pyname}-${pkgver}/doc/source
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
