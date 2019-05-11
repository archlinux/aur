pkgbase=python-serverfiles
pkgname=('python-serverfiles' 'python2-serverfiles')
pkgver=0.3.0
pkgrel=1
pkgdesc="An utility that accesses files on a HTTP server and stores them locally for reuse."
arch=(any)
url="https://github.com/biolab/serverfiles"
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools' 'python-requests' 'python2-requests')
source=("https://pypi.io/packages/source/s/serverfiles/serverfiles-$pkgver.tar.gz")
sha256sums=('ce38e1dc3518a16b2490f7b84b4ce829f2d6685596c1a3f0fdedbe06d13685ec')

build() {
  cp -r "${srcdir}"/serverfiles-$pkgver "${srcdir}"/serverfiles-$pkgver-py2

  cd "${srcdir}"/serverfiles-$pkgver
  python setup.py build

  cd "${srcdir}"/serverfiles-$pkgver-py2
  python2 setup.py build
}

package_python-serverfiles() {
  depends=('python-requests')

  cd "${srcdir}/serverfiles-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-serverfiles() {
  depends=('python2-requests')

  cd "${srcdir}/serverfiles-$pkgver"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}


