# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.skypac
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
# "python-${_pyname}-doc")
pkgver=1.0.5
pkgrel=1
pkgdesc="Sky matching for image mosaic"
arch=('i686' 'x86_64')
url="https://stsci-skypac.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-pytest-runner')
#'python-stsci.tools' 'python-stsci_rtd_theme')
#'python-spherical_geometry' 'python-stsci.tools' 'python-stsci.imagestats' 'python-numpydoc' 'python-sphinx_rtd_theme' 'python-stwcs' 'python-stsci.imagestats')
checkdepends=('python-pytest-doctestplus' 'python-pytest-cov' 'python-codecov' 'python-spherical_geometry' 'python-stwcs' 'python-stsci.imagestats')
source=("https://github.com/spacetelescope/stsci.skypac/archive/${pkgver}.tar.gz")
md5sums=('5fe3fc818628f706d83b51f6ddfd9cd2')

prepare() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
    export _pyver=$(python -V | cut -c 8-10)
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   cd ${srcdir}/${_pyname}-${pkgver}/docs
#   #PYTHONPATH="./build/lib" python setup.py build_sphinx
#   PYTHONPATH="../build/lib" make html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    python setup.py test
##   pytest
#}

package() {
    depends=('python>=3.5' 'python-astropy>=3.1' 'python-spherical_geometry>=1.2.2' 'python-stwcs' 'python-stsci.imagestats')
    optdepends=('python-stsci.skypac-doc: Documentation for STScI skypac')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/stsci/__init__.py"
    rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/stsci/__pycache__"/*
}

#package_python-stsci.skypac-doc() {
#    pkgdesc="Documentation for STScI skypac"
#    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.txt
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
