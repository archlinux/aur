# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=('python-rtslib-fb' 'python2-rtslib-fb')
_pkgname=rtslib-fb
pkgver=2.1.fb63
pkgrel=1
pkgdesc="free branch version of the LIO target API"
arch=('any')
url="https://github.com/agrover/rtslib-fb"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-pyudev' 'python2-pyudev')
backup=()
options=()
install=
source=(https://github.com/agrover/rtslib-fb/archive/v${pkgver}.tar.gz target.service)
sha512sums=('faf5732299def9f5eb9147f930e8b48c9e9a26a918b41aa60f06a1f079e6e0453eb3c2d19136b244ef2349c23d31b7fa15cb4a0b6302ffbcd878033a45a11d1a'
            '3c634f1c466d0a8c3dd2b57a230438aaeeb0e66324863a2ded57dd69a2ca5946f83c4ab511766f510f3e63b43aedcf7e368bcf5bc325ee69c016bb0bb2612de5')


prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
}


package_python-rtslib-fb() {
  depends=('python' 'python-six' 'python-pyudev')
  conflicts=('python2-rtslib' 'targetcli-fb<=2.1.fb31')

  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm 644 doc/targetctl.8 "$pkgdir/usr/share/man/man8/targetctl.8"
  install -Dm 644 doc/saveconfig.json.5 "$pkgdir/usr/share/man/man5/saveconfig.json.5"

  # arch specific
  cd "$srcdir"
  install -d "$pkgdir/etc/target"
  install -d "$pkgdir/etc/target/backup"
  # systemd
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  cp target.service "$pkgdir/usr/lib/systemd/system/"
}

package_python2-rtslib-fb() {
  depends=('python2' 'python2-six' 'python2-pyudev')
  conflicts=('python2-rtslib')

  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  # the service file and targetctl script is in python-rtslib-fb
  rm -r "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
