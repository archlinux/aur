# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python2-astroscrappy
pkgver=1.0.5
pkgrel=2
pkgdesc="Speedy Cosmic Ray Annihilation Package in Python"
arch=('i686' 'x86_64')
url="https://github.com/astropy/astroscrappy"
license=('BSD')
depends=('python2' 'python2-numpy' 'python2-astropy' 'cython2>=0.21')
optdepends=('python-astroscrappy-doc: Documentation for Astro-SCRAPPY'
            'python2-pytest<3.7: For testing'
            'python2-scipy: For testing')
makedepends=('python2-astropy-helpers')
#checkdepends=('python2-pytest' 'python2-scipy')
source=("https://files.pythonhosted.org/packages/source/a/astroscrappy/astroscrappy-${pkgver}.tar.gz")
md5sums=('e7ec5d829191226e6092b08e1d8f4cd4')

prepare() {
    cd ${srcdir}/astroscrappy-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/astroscrappy-${pkgver}
    python2 setup.py build --use-system-libraries --offline
}

#check() {
#    cd ${srcdir}/astroscrappy-${pkgver}
#    python2 setup.py test
#}

package() {
    cd ${srcdir}/astroscrappy-${pkgver}

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}
