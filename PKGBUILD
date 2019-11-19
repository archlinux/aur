pkgbase=python-pyclipper
pkgname=('python-pyclipper' 'python2-pyclipper')
pkgver=1.1.0
pkgrel=3
pkgdesc="Cython wrapper for the C++ translation of the Angus Johnson's Clipper library"
url="https://github.com/greginvm/pyclipper"
arch=(i686 x86_64)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'cython' 'cython2')
source=("https://github.com/greginvm/pyclipper/archive/${pkgver}.tar.gz")
sha256sums=('9c09b8af500bac9bae665182eaa21c365d0da045132472df266417796419831c')

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
