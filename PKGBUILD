# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-cdflib
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.3.20
pkgrel=1
pkgdesc="A python module for reading NASA's Common Data Format (cdf) files Resources"
arch=('any')
url="https://github.com/MAVENSDC/cdflib"
license=('MIT')
makedepends=('python-setuptools')
#'python-sphinx')
#checkdepends=('python-pytest-cov')
checkdepends=('python-astropy' 'python-attrs>=19.2.0')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('51de133e7a748ea7454f76398db0ad7a')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   pytest #|| warning "Tests failed"
    python setup.py test
}

package_python-cdflib() {
    depends=('python>=3.6' 'python-attrs>=19.2.0' 'python-numpy')
    optdepends=('python-aioftp: For downloads over FTP'
                'python-cdflib-doc: Documentation for CDFlib')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-cdflib-doc() {
#    pkgdesc="Documentation for Python CDFlib"
#    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
