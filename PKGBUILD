# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=reposurgeon
pkgver=2.9
pkgrel=1
pkgdesc="Performs surgery on version control repositories."
arch=('any')
url="http://www.catb.org/~esr/reposurgeon/"
license=('BSD')
depends=('python2')
makedepends=('xmlto')
source=(http://www.catb.org/~esr/reposurgeon/$pkgname-$pkgver.tar.gz)
sha256sums=('ce40f4ff1d5fb3491f5478aa977e3016222293306eb4ccb567af707cb03dadd8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e '1s/python/python2/' reposurgeon
  make reposurgeon.1 reposurgeon.html svnpull.1 svnpull.html
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 reposurgeon "$pkgdir/usr/bin/reposurgeon"
  install -Dm755 svnpull "$pkgdir/usr/bin/svnpull"
  install -Dm644 reposurgeon.1 "$pkgdir/usr/share/man/man1/reposurgeon.1"
  install -Dm644 svnpull.1 "$pkgdir/usr/share/man/man1/svnpull.1"

  install -dm755 "$pkgdir/usr/share/doc/reposurgeon"
  install -m644 NEWS README reposurgeon.html svnpull.html TODO \
    "$pkgdir/usr/share/doc/reposurgeon"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/reposurgeon/COPYING"
}

# vim:set ts=2 sw=2 et:
