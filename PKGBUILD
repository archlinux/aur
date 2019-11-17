# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-backoff
pkgname=('python-backoff' 'python2-backoff')
_name=${pkgname#python-}
pkgver=1.9.0
pkgrel=1
pkgdesc="Function decoration for backoff and retry."
arch=('any')
url="https://github.com/litl/backoff"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')

#source=("${_name}-${pkgver}.tar.gz::https://github.com/litl/backoff/archive/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('33c6e75821aa9a23c47870ce945d4f359b0c602ca6501b50c335d4125b582361168d7741579c807abe684aa1f877474a2d4baddd5d0e15bc552f1c3521570d96')

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
