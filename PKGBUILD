# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=reportbug
pkgver=7.1.4
pkgrel=1
pkgdesc="report bugs in the Debian distribution + python modules"
arch=('any')
url="http://packages.debian.org/sid/reportbug"
license=('MIT')
depends=('python-debian' 'python-debianbts' 'python-requests' 'apt'
'sensible-utils')
provides=("python-reportbug=$pkgver")
conflicts=('python-reportbug')
options=(!emptydirs)
backup=('etc/reportbug.conf')
source=(http://ftp.debian.org/debian/pool/main/r/$pkgname/${pkgname}_$pkgver.tar.bz2)
sha256sums=('3a4f0366ee7885408a07c24e6067d4e6ed6990ba6d57494226c916dc43fe27c8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p $pkgdir/usr/share/man/man1/ $pkgdir/usr/share/man/man5/
  install -m644 -t $pkgdir/usr/share/man/man1/ man/*.1
  install -m644 -t $pkgdir/usr/share/man/man5/ man/*.5
  install -Dm644 conf/reportbug.conf $pkgdir/etc/reportbug.conf
}

# vim:set ts=2 sw=2 et:
