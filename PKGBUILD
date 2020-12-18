# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-drizzlepac
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=3.2.0
pkgrel=1
pkgdesc="AstroDrizzle for HST images"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/scientific-community/software/drizzlepac.html"
license=('BSD')
makedepends=('python-setuptools'
             'python-relic'
             'python-astropy')
#            'python-numpydoc'
#            'python-sphinx_rtd_theme'
#            'python-stsci_rtd_theme'
#            'python-stsci.tools'
#            'python-stsci.convolve'
#            'python-stsci.image'
#            'python-stsci.imagestats'
#            'python-stsci.imagemanip'
#            'python-stsci.ndimage'
#            'python-stsci.skypac'
#            'python-stsci.stimage'
#            'python-stwcs'
#            'python-stregion'
#            'python-fitsblender'
#            'python-nictools')
#checkdepends=('python-pytest'
#              'python-matplotlib'
#              'python-scikit-learn'
#              'python-stsci.skypac'
#              'python-ci_watson'
#              'python-fitsblender'
#              'python-nictools'
#              'python-stsci.image'
#              'python-stregion'
#              'python-tweakwcs'
#              'python-astroquery'
#              'python-photutils'
#              'python-pandas'
#              'python-bokeh'
#              'python-pypdf2')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
#       "https://raw.githubusercontent.com/spacetelescope/drizzlepac/master/tests/hap/ACSWFC3ListDefault50.csv"
        "https://raw.githubusercontent.com/spacetelescope/drizzlepac/master/LICENSE.txt")
md5sums=('b0e93c3e3f3c7f90f83e869edf38457e'
#        'SKIP'
         'SKIP')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -rs ${srcdir}/LICENSE.txt .
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_sphinx
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}/build/lib.linux-${CARCH}-${_pyver}
#
#    ln -rs ${srcdir}/ACSWFC3ListDefault50.csv tests/hap
#    pytest || warning "Tests failed"
#}

package_python-drizzlepac() {
    depends=('python>=3.6'
             'python-nose'
             'python-scipy'
             'python-matplotlib'
             'python-requests'
             'python-scikit-learn>=0.20'
             'python-spherical_geometry>=1.2.17'
             'python-stsci.tools>=3.6'
             'python-stsci.image>=2.3.0'
             'python-stsci.imagestats'
             'python-stsci.skypac>=1.0'
             'python-stsci.stimage'
             'python-stwcs>=1.5.3'
             'python-tweakwcs>=0.6.3'
             'python-stregion'
             'python-fitsblender'
             'python-acstools'
             'python-nictools')
    optdepends=('python-astroquery>=0.4: HAP-pipeline specific'
                'python-photutils>=0.7: HAP-pipeline specific'
                'python-bokeh: HAP-pipeline specific'
                'python-pandas: HAP-pipeline specific'
                'python-pypdf2: HAP-pipeline specific'
                'python-pytables: HAP-pipeline specific'
                'python-yaml: HAP-pipeline specific'
                'python-pysynphot'
                'python-lxml: HAP-pipeline specific'
                'python-scikit-image>=0.14.2'
                'python-drizzlepac-doc: Documentation for DrizzlePac')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/tests/__init__.py"
    rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/tests/__pycache__"/__init__*
}

#package_python-drizzlepac-doc() {
#    pkgdesc="Documentation for DrizzlePac"
#    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
