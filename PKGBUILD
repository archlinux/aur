# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-cdflib
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.4.3
pkgrel=1
pkgdesc="A python module for reading NASA's Common Data Format (cdf) files Resources"
arch=('any')
url="https://github.com/MAVENSDC/cdflib"
license=('MIT')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
#'python-sphinx')
#checkdepends=('python-pytest-cov')
#checkdepends=('python-astropy' 'python-attrs>=19.2.0')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('b16eb75054471d53b0fca3c7217987f3')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   python setup.py build_sphinx
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    pytest #|| warning "Tests failed"
##   python setup.py test
#}

package_python-cdflib() {
    depends=('python>=3.6' 'python-attrs>=19.2.0' 'python-numpy')
    optdepends=('python-aioftp: For downloads over FTP'
                'python-cdflib-doc: Documentation for CDFlib')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-cdflib-doc() {
#    pkgdesc="Documentation for Python CDFlib"
#    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
