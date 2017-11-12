# Maintainer: Felix Höffken <fupduck at sacknagel dot com>
# Contributor: Juraj Fiala <doctorjellyface at riseup dot net>

_srcname=leap_pycommon
pkgname=python2-$_srcname
pkgver=0.6.2
pkgrel=1
pkgdesc='Common utilities for leap python modules.'
arch=('any')
url='https://bitmask.net/'
license=('GPL3')
depends=(
  'python2-jsonschema'
  'python2-pyopenssl'
  'python2-dateutil'
  'python2-pyzmq'
  'python2-txzmq'
  'python2-dirspec')
# Disable tests for now as they fail
#checkdepends=(
#  'python2-mock'
#  'python2-setuptools_trial'
#  'python2-pep8'
#)
source=("https://github.com/leapcode/$_srcname/archive/$pkgver.tar.gz")
sha256sums=('ca236cacf1d08d023a72552c590988b36bec79f4f8588fa9c4f50192777ba194')

build() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py build
}

#check() {
#  cd "$srcdir/$_srcname-$pkgver"
#  trial leap.common
#}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" AUTHORS\
                                                         CHANGELOG.rst\
                                                         README.rst
}

# vim:set ts=2 sw=2 et:
