pkgbase=python-ppft
pkgname=('python-ppft' 'python2-ppft')
pkgver=1.6.4.6
pkgrel=1
pkgdesc="distributed and parallel python "
url="http://trac.mystic.cacr.caltech.edu/project/pathos/wiki.html"
arch=(any)
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-six' 'python2-six' 'python-dill' 'python2-dill')
source=("https://github.com/uqfoundation/ppft/releases/download/ppft-${pkgver}/ppft-${pkgver}.tgz")
sha1sums=('6b6610ad3194ae9773c9f802449b951498a738f0')

build() {
  cp -r "${srcdir}"/ppft-$pkgver "${srcdir}"/ppft-$pkgver-py2

  cd "${srcdir}"/ppft-$pkgver
  python setup.py build

  cd "${srcdir}"/ppft-$pkgver-py2
  python2 setup.py build
}

package_python-ppft() {
  depends=('python-six' 'python-dill')

  cd "${srcdir}/ppft-$pkgver"
  python setup.py install --root=${pkgdir}
}

package_python2-ppft() {
  depends=('python2-six' 'python2-dill')

  cd "${srcdir}/ppft-$pkgver"
  python2 setup.py install --root=${pkgdir}
  mv ${pkgdir}/usr/bin/ppserver.py ${pkgdir}/usr/bin/ppserver2.py
}

