# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-backoff
pkgname=('python-backoff' 'python2-backoff')
_name=${pkgname#python-}
pkgver=1.10.0
pkgrel=1
pkgdesc="Function decoration for backoff and retry."
arch=('any')
url="https://github.com/litl/backoff"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')

#source=("${_name}-${pkgver}.tar.gz::https://github.com/litl/backoff/archive/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('87f64612ec1d6f80d2f173846af196bd347f1fcc6c6f93275dd1cb3b5486789f3c6e98e1080ed6f3b13e28c1b056fb1baa6da73639d4b9b460fedf68bb012422')

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
