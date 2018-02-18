# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-regions
pkgname=('python-regions' 'python-regions-doc')
pkgver=0.2
pkgrel=3
pkgdesc="Astropy affilated package for region handling"
arch=('i686' 'x86_64')
url="http://astropy-regions.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('cython' 'python-astropy>=1.2' 'python-astropy-helpers' 'python-sphinx' 'python-matplotlib')
#checkdepends=('python-pytest-arraydiff')
source=("https://files.pythonhosted.org/packages/source/r/regions/regions-${pkgver}.tar.gz")
md5sums=('48597dc17906e478292040dae2df5596')

prepare() {
    cd ${srcdir}/regions-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build () {
    cd ${srcdir}/regions-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

#check(){
#    cd ${srcdir}/astroplan-${pkgver}
#
#    python setup.py test
#}

package_python-regions() {
    depends=('python>=3.4' 'python-numpy>=1.9' 'python-astropy>=1.2')
    optdepends=('python-matplotlib>=1.5: Plotting support'
                'python-shapely: Managing geometric objects'
                'python-pytest-arraydiff: For testing'
                'python-regions-doc: Documentation for AstroPy Regions')
    cd ${srcdir}/regions-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-regions-doc() {
    pkgdesc="Documentation for AstroPy Regions"
    cd ${srcdir}/regions-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
