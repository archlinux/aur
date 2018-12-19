# Maintainer: Astro Benzene <universebenzene at sina dot com>
#pkgbase=python-astroscrappy
pkgname=('python-astroscrappy')
#'python-astroscrappy-doc')
pkgver=1.0.8
pkgrel=1
pkgdesc="Speedy Cosmic Ray Annihilation Package in Python"
arch=('i686' 'x86_64')
url="https://github.com/astropy/astroscrappy"
license=('BSD')
makedepends=('cython>=0.21' 'python-astropy' 'python-astropy-helpers' 'python-sphinx-astropy')
checkdepends=('python-pytest-astropy')
source=("https://files.pythonhosted.org/packages/source/a/astroscrappy/astroscrappy-${pkgver}.tar.gz")
md5sums=('eb68a7c81ea8d4370eab66e9c7859576')

prepare() {
    cd ${srcdir}/astroscrappy-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/astroscrappy-${pkgver}
    python setup.py build --use-system-libraries --offline

#   msg "Building Docs"
#   python setup.py build_docs
}

check() {
    cd ${srcdir}/astroscrappy-${pkgver}

    python setup.py test
}

package_python-astroscrappy() {
    depends=('python' 'python-numpy' 'python-astropy' 'cython>=0.21')
    optdepends=('python-astroscrappy-doc: Documentation for Astro-SCRAPPY')
    cd ${srcdir}/astroscrappy-${pkgver}

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

#package_python-astroscrappy-doc() {
#    pkgdesc="Documentation for Astro-SCRAPPY"
#    cd ${srcdir}/astroscrappy-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
