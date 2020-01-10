pkgbase=python-pyclipper
pkgname=('python-pyclipper' 'python2-pyclipper')
pkgver=1.1.0.post3
pkgrel=1
pkgdesc="Cython wrapper for the C++ translation of the Angus Johnson's Clipper library"
url="https://github.com/fonttools/pyclipper"
arch=(i686 x86_64)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'cython' 'cython2')
source=("pyclipper-$pkgver::git+https://github.com/greginvm/pyclipper.git")
sha256sums=('SKIP')  # not cool, but pyclipper build process needs .git metadata

prepare() {
  cd "${srcdir}/pyclipper-$pkgver"
  git checkout --quiet --force $pkgver
}

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
