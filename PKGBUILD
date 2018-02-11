pkgbase=python-conversionutil
pkgname=('python-conversionutil' 'python2-conversionutil')
pkgver=1.1.0
pkgrel=1
pkgdesc="A collection of conversion utilities"
url="https://bitbucket.org/davisowb/conversionutil"
arch=(any)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' python-timingsutil python-six python-logging-helper python2-timingsutil python2-six python2-logging-helper)
source=("https://pypi.io/packages/source/c/conversionutil/conversionutil-${pkgver}.tar.gz")
md5sums=('84f3ef553e04c92014398f99f0e1f9a7')

prepare() {
  cd "${srcdir}"/conversionutil-$pkgver
}

build() {
  cp -r "${srcdir}"/conversionutil-$pkgver "${srcdir}"/conversionutil-$pkgver-py2

  cd "${srcdir}"/conversionutil-$pkgver
  python setup.py build

  cd "${srcdir}"/conversionutil-$pkgver-py2
  python2 setup.py build
}

package_python-conversionutil() {
  depends=(python-timingsutil python-six python-logging-helper)

  cd "${srcdir}/conversionutil-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-conversionutil() {
  depends=(python2-timingsutil python2-six python2-logging-helper)

  cd "${srcdir}/conversionutil-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

