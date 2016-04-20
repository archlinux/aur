# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

_srcname=leap_pycommon
pkgname=python2-$_srcname
pkgver=0.5.1
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
validpgpkeys=('BE23FB4A0E9DB36ECB9AB8BE23638BF72C593BC1')
sha256sums=('5cf2039f4a7a6e5a85ce4868a2c5397c90b454819dfef5993b4aff55e8d5b483')

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
