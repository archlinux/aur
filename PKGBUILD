pkgbase=python-pox
pkgname=('python-pox' 'python2-pox')
#pkgname=python-pox
pkgver=0.2.4
pkgrel=1
pkgdesc="utilities for filesystem exploration and automated builds"
url="http://trac.mystic.cacr.caltech.edu/project/pathos/wiki/pox.html"
arch=(any)
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/uqfoundation/pox/archive/$pkgver.tar.gz")
sha1sums=('5b3616a3e8acf4961818d9207ca0e779b238f80f')

build() {
  cp -r "${srcdir}"/pox-$pkgver "${srcdir}"/pox-$pkgver-py2

  cd "${srcdir}"/pox-$pkgver
  python setup.py build

  cd "${srcdir}"/pox-$pkgver-py2
  python2 setup.py build
}

package_python-pox() {
  depends=('python')

  cd "${srcdir}/pox-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-pox() {
  depends=('python2')

  cd "${srcdir}/pox-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1

  mv ${pkgdir}/usr/bin/pox ${pkgdir}/usr/bin/pox2
}

