# Maintainer: Felix Höffken <felix at ctrl.alt.coop>
# Contributor: Juraj Fiala <doctorjellyface at riseup dot net
_srcname=srp

pkgname="python-$_srcname"
pkgbase=python-srp
pkgver=1.0.22
pkgrel=0
pkgdesc='Python implementation of the Secure Remote Password protocol (SRP)'
arch=('any')
url="https://github.com/cocagne/py$_srcname"
license=('MIT')
depends=('python' 'python-six' 'openssl' )
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('11a589e7776cdb393fd08434c8ec209defe2261d2328ed634e07929788208a73')

build() {
  cd "$srcdir/py$_srcname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/py$_srcname-$pkgver"
  python srp/test_srp.py
}

package() {
  cd "$srcdir/py$_srcname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
