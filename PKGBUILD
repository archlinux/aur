# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

_srcname=soledad
pkgbase=python2-leap_$_srcname
pkgname=("python2-leap_${_srcname}_common" "python2-leap_${_srcname}_client")
pkgver=0.8.0
pkgrel=1
pkgdesc='Synchronization Of Locally Encrypted Data Among Devices.'
arch=('any')
url='https://bitmask.net/'
license=('GPL3')
depends=(
  'python2-u1db'
  'python2-oauth'
  'python2-leap_pycommon')
source=("https://github.com/leapcode/$_srcname/archive/$pkgver.tar.gz")
validpgpkeys=('BE23FB4A0E9DB36ECB9AB8BE23638BF72C593BC1')
sha256sums=('b0c5d28b6044368697871efc89d5e6101fec40fecaba7b0698fae0c765ebcf16')

build() {
  # Common
  cd "$srcdir/$_srcname-$pkgver/common"
  python2 setup.py build

  # Client
  cd "$srcdir/$_srcname-$pkgver/client"
  python2 setup.py build
}

package_python2-leap_soledad_common() {
  cd "$srcdir/$_srcname-$pkgver/common"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}

package_python2-leap_soledad_client() {
  depends=(
    'python2-pysqlcipher'
    'python2-scrypt'
    'pycryptopp'
    'python2-cchardet'
    'python2-zope-proxy'
    'python2-twisted'
    'python2-leap_soledad_common')

  cd "$srcdir/$_srcname-$pkgver/client"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
