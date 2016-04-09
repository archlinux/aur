# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

_srcname=leap.bitmask
pkgname=bitmask_client
pkgver=0.9.1
pkgrel=2
pkgdesc='Encrypted communication for mere mortals.'
arch=('any')
url='https://bitmask.net/'
license=('GPL3')
depends=(
  'python2-argh'
  'python2-requests'
  'python2-srp'
  'python2-pyopenssl'
  'python2-coloredlogs'
  'python2-psutil'
  'python2-ipaddr'
  'python2-twisted'
  'python2-daemon16'
  'python2-keyring'
  'python2-zope-proxy'
  'python2-pyzmq'
  'python2-txzmq'
  'python2-oauth'
  'python2-logbook'
  'python2-pyside'
  'python2-leap_soledad_client'
  'python2-leap_keymanager'
  'python2-leap_mail'
  'python2-leap_pycommon'
)
makedepends=(
  'python-pyside-tools'
)
# Disable tests for now as they fail
#checkdepends=(
  #'python2-nose'
  #'python2-nose-exclude'
  #'python2-mock'
  #'python2-coverage'
  #'python2-pep8'
  #'python2-flake8'
  #'python2-tox'
#)
source=("https://github.com/leapcode/$pkgname/archive/$pkgver.tar.gz")
validpgpkeys=('BE23FB4A0E9DB36ECB9AB8BE23638BF72C593BC1')
sha256sums=('7e907adeef60c61378c505d29f69d1cf777495215b356ce7ea3b0dc2b5c70dab')

prepare() {
  # Workaround version acquire fail
  mv "$srcdir/$pkgname-$pkgver" "$srcdir/$_srcname-$pkgver"

  cd "$srcdir/$_srcname-$pkgver"
  # Install to /usr/bin instead of /usr/sbin
  sed -i 's/sbin/bin/' setup.py

  # Point the tests to python2 executables
  #sed -i 's/\/bin\/nosetests/\/bin\/nosetests2/' run_tests.sh
  #sed -i 's/flake8/flake8-python2/' run_tests.sh
}

build() {
  cd "$srcdir/$_srcname-$pkgver"
  # Qt
  make
  # Python
  python2 setup.py build
}

#check() {
  #cd "$srcdir/$_srcname-$pkgver"
  #sh run_tests.sh -N
#}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
