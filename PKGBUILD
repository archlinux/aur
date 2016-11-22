pkgbase=python-pyclipper
pkgname=('python-pyclipper' 'python2-pyclipper')
pkgver=1.0.5
pkgrel=1
pkgdesc="Cython wrapper for the C++ translation of the Angus Johnson's Clipper library"
url="https://github.com/greginvm/pyclipper"
arch=(any)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-cython' 'python2-cython')
source=("https://github.com/greginvm/pyclipper/archive/${pkgver}.tar.gz")
sha256sums=('6b76702875cfcbdb4a4e500a1c23c1c93f39bad1c75a828f4151927000783d34')

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

