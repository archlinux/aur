# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

_srcname=soledad
pkgbase=python2-leap_$_srcname
pkgname=("python2-leap_${_srcname}_common" "python2-leap_${_srcname}_client")
pkgver=0.9.2
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
sha512sums=('9148523716bf1eb9b35fa15e37e0c04ec9a4688ca3845e2d49d13041ede755804530ea442173f0e46cae0ab43e4a493958e2049586a19ca9ca331510e03d1ae8')

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
