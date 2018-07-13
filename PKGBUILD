# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python2-spherical_geometry
pkgver=1.2.5
pkgrel=1
pkgdesc="Python based tools for spherical geometry"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/resources/software_hardware/stsci_python"
license=('BSD')
depends=('python2>=2.7' 'python2-numpy>=1.5.0' 'qd>=2.3.7' 'python2-astropy>=0.3')
makedepends=('cython2' 'python2-astropy-helpers')
checkdepends=('python2-pytest')
optdepends=('python-spherical_geometry-doc: Documentation for Spherical Geometry Toolkit')
source=("https://files.pythonhosted.org/packages/source/s/spherical_geometry/spherical_geometry-${pkgver}.tar.gz")
md5sums=('bf33af71561a69231c9d5e1238e557c5')

prepare() {
    cd ${srcdir}/spherical_geometry-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build () {
    cd ${srcdir}/spherical_geometry-${pkgver}
    python2 setup.py build --use-system-libraries --offline
}

check(){
    cd ${srcdir}/spherical_geometry-${pkgver}
    python2 setup.py test
}

package() {
    cd ${srcdir}/spherical_geometry-${pkgver}

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}
