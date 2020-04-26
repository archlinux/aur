# Package maintainer: Leonid B <leonid dot bloch at esrf dot fr>
# Upstream contact: silx at esrf dot fr
pkgname=python-silx
pkgver=0.12.0
pkgrel=1
pkgdesc="A collection of Python packages for data analysis at synchrotron radiation facilities."
arch=('any')
url="http://www.silx.org"
license=('MIT' 'LGPL')
depends=('python-numpy' 'python-pyqt5' 'python-matplotlib')
optdepends=('python-h5py: for HDF5 input/output'
            'ipython: for interactive console'
            'python-qtconsole: for GUI console'
            'python-pyopencl: for sift - OpenCL implementation'
            'opencl-driver: for sift - OpenCL implementation')
makedepends=('cython')
source=("https://github.com/silx-kit/${pkgname#*-}/archive/v${pkgver}.tar.gz")
sha256sums=('b282d93a383090dd47ed05d3cc8b5cc06ede0625cc88994534dd5a545f9eeeef')

build() {
    cd "${pkgname#*-}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname#*-}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
