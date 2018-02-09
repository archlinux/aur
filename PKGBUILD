pkgbase=python-logging-helper
pkgname=('python-logging-helper' 'python2-logging-helper')
pkgver=1.7.0
pkgrel=1
pkgdesc="Provides some enhancements to built-in logging module"
url="https://pypi.python.org/pypi/logging-helper"
arch=(any)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/l/logging_helper/logging_helper-${pkgver}.tar.gz")
md5sums=('a0deb04b50222c733940b51ae074bf03')

prepare() {
  cd "${srcdir}"/logging_helper-$pkgver
}

build() {
  cp -r "${srcdir}"/logging_helper-$pkgver "${srcdir}"/logging_helper-$pkgver-py2

  cd "${srcdir}"/logging_helper-$pkgver
  python setup.py build

  cd "${srcdir}"/logging_helper-$pkgver-py2
  python2 setup.py build
}

package_python-logging-helper() {
  depends=('python-better-exceptions')

  cd "${srcdir}/logging_helper-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-logging-helper() {
  depends=('python2-better-exceptions')

  cd "${srcdir}/logging_helper-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

