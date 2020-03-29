# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-acstools
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=3.1.0
pkgrel=1
pkgdesc="Python Tools for ACS (Advanced Camera for Surveys) Data"
arch=('i686' 'x86_64')
url="https://acstools.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools-scm')
#'python-pandas')
#'python-astropy' 'python-beautifulsoup4' 'python-sphinx-automodapi' 'python-sphinx_rtd_theme' 'python-matplotlib')
# 'python-relic'
checkdepends=('python-pytest-astropy-header'
              'python-astropy'
              'python-beautifulsoup4'
              'python-requests'
              'python-ci_watson')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/spacetelescope/acstools/master/LICENSE.md")
md5sums=('79006400b47ab2fca9121d2480508a64'
         '842677f1439854aa021b76c36a50fe5a')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
##   rm -r relic
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   cd ${srcdir}/${_pyname}-${pkgver}/doc
#   PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest
}

package() {
    depends=('python>=3.6' 'python-astropy>=2' 'python-beautifulsoup4' 'python-requests')
    optdepends=('python-acstools-doc: Documentation for Python ACS Tools')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.md"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-acstools-doc() {
#    pkgdesc="Documentation for Python ACS Tools"
#    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
