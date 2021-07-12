# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-backoff
pkgname=('python-backoff' 'python2-backoff')
_name=${pkgname#python-}
pkgver=1.11.0
pkgrel=1
pkgdesc="Function decoration for backoff and retry."
arch=('any')
url="https://github.com/litl/backoff"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')

#source=("${_name}-${pkgver}.tar.gz::https://github.com/litl/backoff/archive/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('fca6aa8e1c77b0c9f668b9303bf1b70eb86c86da64081bab755e38c0426f65476f4f54f0e12759fa7a00bf7d9e5dc55f651489c03a16f5473389e3fb4d1b9bd0')

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
