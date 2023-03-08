# Package maintainer: Leonid B <leonid dot bloch at esrf dot fr>
# Upstream contact: silx at esrf dot fr
pkgname=python-silx
pkgver=1.1.2
pkgrel=2
pkgdesc="A collection of Python packages for data analysis at synchrotron radiation facilities."
arch=('any')
url="http://www.silx.org"
license=('MIT' 'LGPL')
depends=('python-numpy' 'python-pyqt5' 'python-matplotlib' 'python-fabio')
optdepends=('python-h5py-openmpi: for HDF5 input/output'
            'ipython: for interactive console'
            'python-qtconsole: for GUI console'
            'python-pyopencl: for sift - OpenCL implementation'
            'opencl-driver: for sift - OpenCL implementation')
makedepends=('cython')
source=("https://github.com/silx-kit/${pkgname#*-}/archive/v${pkgver}.tar.gz")
sha256sums=('2efd287c04b2692257c93231148c77ffb9a444cc5b1b17a4bd35c9918ddbcb6f')

build() {
    cd "${pkgname#*-}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname#*-}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
