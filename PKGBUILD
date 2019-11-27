# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-pagekite
pkgname=pagekite
pkgver=1.0.0.190721
pkgrel=1
pkgdesc='Python implementation of the PageKite remote front-end protocols.'
arch=('any')
url='http://pagekite.org'
license=('AGPL3')
depends=('python2' 'python2-socksipychain')
makedepends=('python2-setuptools')
provides=('pagekite')
conflicts=('python2-pagekite')
options=(!emptydirs zipman)
source=("https://pagekite.net/pk/src/$pkgname-$pkgver.tar.gz")
sha256sums=('f0237a9eec485a75c60d2d876eab54f9f5695fe4125a26918b26cb3b1a569b78')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # Config files
  for configfile in etc/pagekite.d/*
  do
    install -m 644 -D $configfile $pkgdir/etc/pagekite.d/$(basename $configfile)
  done

  # Man pages
  for manpage in doc/*.1
  do
    install -m 644 -D $manpage $pkgdir/usr/share/man/man1/$(basename $manpage)
  done

  # logrotate
  install -m 644 -D etc/logrotate.d/pagekite.debian $pkgdir/etc/logrotate.d/pagekite
}

# vim:set ts=2 sw=2 et:
