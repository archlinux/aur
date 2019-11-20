# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-backoff
pkgname=('python-backoff' 'python2-backoff')
_name=${pkgname#python-}
pkgver=1.9.2
pkgrel=1
pkgdesc="Function decoration for backoff and retry."
arch=('any')
url="https://github.com/litl/backoff"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')

#source=("${_name}-${pkgver}.tar.gz::https://github.com/litl/backoff/archive/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('33bc0565eff99e1ce20693a52f9caea90d863c77412ca15b0ea75ae9da56591340f8832c4f8f6ae083baab63b3ba93fd8320c37d49fbaec88cdad80a75b2c9c0')

prepare() {
  cp -a backoff-${pkgver}{,-py2}
}

package_python-backoff() {
  cd backoff-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-backoff() {
  cd backoff-${pkgver}-py2
  # There are errors during byte-compile, but they don't matter...
  # https://github.com/litl/backoff/issues/77
  python2 setup.py install --root="$pkgdir" --optimize=1
}
