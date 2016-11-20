pkgbase=python-twitter3
pkgname=('python-twitter3' 'python2-twitter3')
pkgver=3.1
pkgrel=1
pkgdesc="A Python wrapper around the Twitter API"
url="https://github.com/bear/python-twitter"
arch=(any)
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/96/69/53b87d2b717a669eb8f46d6e1d180d0a691f3d303631ca6be80f9d036a2a/python-twitter-3.1.tar.gz")
md5sums=('2e00d057a22db298709f768a96cc88ef')

prepare() {
  cd "${srcdir}"/python-twitter-$pkgver
}

build() {
  cp -r "${srcdir}"/python-twitter-$pkgver "${srcdir}"/python-twitter-$pkgver-py2

  cd "${srcdir}"/python-twitter-$pkgver
  python setup.py build

  cd "${srcdir}"/python-twitter-$pkgver-py2
  python2 setup.py build
}

package_python-twitter3() {
  depends=('python')
  provides=('python-twitter')
  conflicts=('python-twitter')

  cd "${srcdir}/python-twitter-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-twitter3() {
  depends=('python2')
  provides=('python2-twitter')
  conflicts=('python2-twitter')

  cd "${srcdir}/python-twitter-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

