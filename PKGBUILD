# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=reportbug
_python=python2
pkgver=6.6.6
pkgrel=1
pkgdesc="report bugs in the Debian distribution + python modules"
arch=('any')
url="http://packages.debian.org/sid/reportbug"
license=('MIT')
depends=('python2-debian' 'python2-debianbts' 'python2-support' 'apt'
'sensible-utils')
provides=("python2-reportbug=$pkgver")
conflicts=('python2-reportbug')
options=(!emptydirs)
backup=('etc/reportbug.conf')
source=(http://ftp.debian.org/debian/pool/main/r/$pkgname/${pkgname}_$pkgver.tar.bz2)
sha256sums=('d9667bde27f8a275a96c200dd7492fd4318ca3924c86abcd4413d95eb2261e35')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  $_python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  $_python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p $pkgdir/usr/share/man/man1/ $pkgdir/usr/share/man/man5/
  install -m644 -t $pkgdir/usr/share/man/man1/ man/*.1
  install -m644 -t $pkgdir/usr/share/man/man5/ man/*.5
  install -Dm644 conf/reportbug.conf $pkgdir/etc/reportbug.conf
}

# vim:set ts=2 sw=2 et:
