pkgbase=python-pyclipper
pkgname=('python-pyclipper' 'python2-pyclipper')
pkgver=1.0.6
pkgrel=1
pkgdesc="Cython wrapper for the C++ translation of the Angus Johnson's Clipper library"
url="https://github.com/greginvm/pyclipper"
arch=(any)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'cython' 'cython2')
source=("https://github.com/greginvm/pyclipper/archive/${pkgver}.tar.gz")
sha256sums=('3c4b70b106bffd736146051f031e2fc5d815d2b13453604d05fb636bb487dcbd')

build() {
  cp -r "${srcdir}"/pyclipper-$pkgver "${srcdir}"/pyclipper-$pkgver-py2

  cd "${srcdir}"/pyclipper-$pkgver
  python setup.py build

  cd "${srcdir}"/pyclipper-$pkgver-py2
  python2 setup.py build
}

package_python-pyclipper() {
  depends=('python')

  cd "${srcdir}/pyclipper-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-pyclipper() {
  depends=('python2')

  cd "${srcdir}/pyclipper-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

