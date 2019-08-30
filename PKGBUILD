# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-drizzlepac
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=2.2.6
pkgrel=1
pkgdesc="AstroDrizzle for HST images"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/scientific-community/software/drizzlepac.html"
license=('BSD')
makedepends=('python-setuptools'
             'python-relic'
             'python-spherical_geometry'
             'python-numpydoc'
             'python-sphinx_rtd_theme'
             'python-stsci_rtd_theme'
             'python-stsci.tools'
             'python-stsci.convolve'
             'python-stsci.image'
             'python-stsci.imagestats'
             'python-stsci.imagemanip'
             'python-stsci.ndimage'
             'python-stsci.skypac'
             'python-stsci.stimage'
             'python-stwcs'
             'python-stregion'
             'python-fitsblender'
             'python-nictools')
#checkdepends=('python-pytest-remotedata' 'python-nose' 'python-ci_watson' 'python-crds')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/spacetelescope/drizzlepac/master/LICENSE.txt")
md5sums=('a4212f8f8d4c8aaaa69d4f20d6053fae'
         'b45bee901c15ab7e1ac3e5e3626d535d')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -rs ${srcdir}/LICENSE.txt .
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    python setup.py build_sphinx
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    python setup.py test
#}

package_python-drizzlepac() {
    depends=('python>=3.5'
             'python-nose'
             'python-spherical_geometry'
             'python-stsci.tools'
             'python-stsci.convolve'
             'python-stsci.image>=2.3.0'
             'python-stsci.imagestats'
             'python-stsci.imagemanip'
             'python-stsci.ndimage'
             'python-stsci.skypac'
             'python-stsci.stimage'
             'python-stwcs'
             'python-stregion'
             'python-fitsblender'
#            'python-acstools'
             'python-nictools')
    optdepends=('python-drizzlepac-doc: Documentation for DrizzlePac')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-drizzlepac-doc() {
    pkgdesc="Documentation for DrizzlePac"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
