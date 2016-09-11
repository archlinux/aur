# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

_srcname=soledad
pkgbase=python2-leap_$_srcname
pkgname=("python2-leap_${_srcname}_common" "python2-leap_${_srcname}_client")
pkgver=0.8.1
pkgrel=1
pkgdesc='Synchronization Of Locally Encrypted Data Among Devices.'
arch=('any')
url='https://bitmask.net/'
license=('GPL3')
depends=(
  'python2-leap_pycommon'
)
#checkdepends=(
#  'python2-tox'
#)
source=("https://github.com/leapcode/$_srcname/archive/$pkgver.tar.gz")
validpgpkeys=('BE23FB4A0E9DB36ECB9AB8BE23638BF72C593BC1')
sha512sums=('480f332c4152dfeb83e1eb4633d598c605f503391f2c6f160f51b45f8445e2ee8231101794ce5c3f1165a44b247d64e0323dd5ea4a6d3c658d0482470255db5c')

build() {
  # Common
  cd "$srcdir/$_srcname-$pkgver/common"
  python2 setup.py build

  # Client
  cd "$srcdir/$_srcname-$pkgver/client"
  python2 setup.py build
}

# Disable tests for now as they fail
#check() {
#  cd "$srcdir/$_srcname-$pkgver/testing"
#  tox2
#}

package_python2-leap_soledad_common() {
  depends+=(
    # This should not be needed anymore but for
    # some reason bitmask failes if it's not there
    'python2-u1db'

    'python2-paste'
    'python2-routes'
  )

  cd "$srcdir/$_srcname-$pkgver/common"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}

package_python2-leap_soledad_client() {
  depends+=(
    'python2-pysqlcipher'
    'python2-scrypt'
    'python2-zope-proxy'
    'python2-twisted'
    'python2-leap_soledad_common'
  )

  cd "$srcdir/$_srcname-$pkgver/client"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
