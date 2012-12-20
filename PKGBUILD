# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=reposurgeon
pkgver=2.11
pkgrel=2
pkgdesc="Performs surgery on version control repositories."
arch=('any')
url="http://www.catb.org/esr/reposurgeon/"
license=('BSD')
depends=('python2')
makedepends=('xmlto')
optdepends=('cvsps>=3.0: For reading CVS repositories')
source=(http://www.catb.org/~esr/reposurgeon/$pkgname-$pkgver.tar.gz)
sha256sums=('bf426a2006f87ff26d00873bdf26fee7e9010b39ec1b0622e0ec37d53bce4561')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e '1s/python/python2/' repodiffer reposurgeon
  make repodiffer.1 repodiffer.html repopuller.1 repopuller.html \
    reposurgeon.1 reposurgeon.html features.html
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 repodiffer "$pkgdir/usr/bin/repodiffer"
  install -Dm755 repopuller "$pkgdir/usr/bin/repopuller"
  install -Dm755 reposurgeon "$pkgdir/usr/bin/reposurgeon"
  install -Dm644 repodiffer.1 "$pkgdir/usr/share/man/man1/repodiffer.1"
  install -Dm644 repopuller.1 "$pkgdir/usr/share/man/man1/repopuller.1"
  install -Dm644 reposurgeon.1 "$pkgdir/usr/share/man/man1/reposurgeon.1"

  install -dm755 "$pkgdir/usr/share/doc/reposurgeon"
  install -m644 NEWS README repodiffer.html reposurgeon.html repopuller.html \
    features.html TODO "$pkgdir/usr/share/doc/reposurgeon"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/reposurgeon/COPYING"
}

# vim:set ts=2 sw=2 et:
