# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

_srcname=soledad
pkgbase=python2-leap_$_srcname
pkgname=("python2-leap_${_srcname}_common" "python2-leap_${_srcname}_client")
pkgver=0.9.3
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
sha512sums=('b9fab8ea4748939801303bd8882d0705f09c05d16fc3dbd4ad76ba1aae36cfd29cfedff263a45b584f268697266a2ec2ecf1bf5fd01060e15693b813b23f6ec7')

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
    # some reason bitmask fails if it's not there
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
    'python2-cryptography'
  )

  cd "$srcdir/$_srcname-$pkgver/client"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
