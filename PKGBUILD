# Package maintainer: Leonid B <leonid dot bloch at esrf dot fr>
# Upstream contact: silx at esrf dot fr
pkgname=python-silx
pkgver=2.1.0
pkgrel=1
pkgdesc="A collection of Python packages for data analysis at synchrotron radiation facilities."
arch=('any')
url="http://www.silx.org"
license=('MIT' 'LGPL')
depends=('python-numpy' 'python-pyqt5' 'python-matplotlib' 'python-fabio')
optdepends=('python-h5py: for HDF5 input/output'
            'ipython: for interactive console'
            'python-qtconsole: for GUI console'
            'python-pyopencl: for sift - OpenCL implementation'
            'opencl-driver: for sift - OpenCL implementation')
makedepends=('cython' 'python-setuptools')
source=("https://github.com/silx-kit/${pkgname#*-}/archive/v${pkgver}.tar.gz")
sha256sums=('364f9a3614653d7d77648fbe08008c1c438ae3437d400403fc4376a3ffcc34ef')

build() {
    cd "${pkgname#*-}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname#*-}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
