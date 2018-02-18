# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-spherical_geometry
pkgname=('python-spherical_geometry' 'python-spherical_geometry-doc')
pkgver=1.1.0
pkgrel=3
pkgdesc="Python based tools for spherical geometry"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/resources/software_hardware/stsci_python"
license=('BSD')
makedepends=('cython' 'qd>=2.3.7' 'python-astropy>=0.3' 'python-astropy-helpers' 'python-sphinx' 'python-matplotlib')
#checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/s/spherical_geometry/spherical_geometry-${pkgver}.tar.gz")
md5sums=('83511d7d9ec2862f138e9e551432a544')

prepare() {
    cd ${srcdir}/spherical_geometry-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build () {
    cd ${srcdir}/spherical_geometry-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

#check(){
#    cd ${srcdir}/spherical_geometry-${pkgver}
#
#    python setup.py test
#}

package_python-spherical_geometry() {
    depends=('python>=3.5' 'python-numpy>=1.5' 'qd>=2.3.7' 'python-astropy>=0.3')
    optdepends=('python-spherical_geometry-doc: Documentation for Spherical Geometry Toolkit')
    cd ${srcdir}/spherical_geometry-${pkgver}

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-spherical_geometry-doc() {
    pkgdesc="Documentation for Python Spherical Geometry Toolkit"
    cd ${srcdir}/spherical_geometry-${pkgver}/build/sphinx

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
