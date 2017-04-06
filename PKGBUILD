# Package maintainer: Leonid B <leonid dot bloch at esrf dot fr>
# Upstream contact: silx at esrf dot fr
pkgname=python-fabio
pkgver=0.4.0
pkgrel=2
pkgdesc="I/O library for images produced by 2D X-ray detectors."
arch=('any')
url="http://www.silx.org"
license=('MIT' 'LGPL' 'Apache')
depends=('python-numpy' 'python-pillow' 'python-lxml')
optdepends=('python-pyqt4: for the fabio_viewer program')
makedepends=('cython')
source=("https://github.com/silx-kit/${pkgname#*-}/archive/v${pkgver}.tar.gz" "pyqt4_qstring_fix.patch")
sha256sums=('ae1f2f979f801524558cac81ec8988d1eadce65b540cdeb46166162ae4788956'
            'e10b98cce6465ac055b1b5744417b8ceb2d081ada3b9621f73651d0c2ad4f42b')

prepare() {
   patch -Np1 -i "pyqt4_qstring_fix.patch"
}

build() {
    cd "${pkgname#*-}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname#*-}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
