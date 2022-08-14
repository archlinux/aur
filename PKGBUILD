# Package maintainer: Leonid B <leonid dot bloch at esrf dot fr>
# Upstream contact: silx at esrf dot fr
pkgname=python-silx
pkgver=1.0.0
pkgrel=1
pkgdesc="A collection of Python packages for data analysis at synchrotron radiation facilities."
arch=('any')
url="http://www.silx.org"
license=('MIT' 'LGPL')
depends=('python-numpy' 'python-pyqt5' 'python-matplotlib')
optdepends=('python-h5py-openmpi: for HDF5 input/output'
            'ipython: for interactive console'
            'python-qtconsole: for GUI console'
            'python-pyopencl: for sift - OpenCL implementation'
            'opencl-driver: for sift - OpenCL implementation')
makedepends=('cython')
source=("https://github.com/silx-kit/${pkgname#*-}/archive/v${pkgver}.tar.gz")
sha256sums=('c9a57b7a253d9cdca92404cd0ba0bed88115681e1982bae45101b7d85c55bde0')

build() {
    cd "${pkgname#*-}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname#*-}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
