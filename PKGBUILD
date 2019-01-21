# Maintainer: Achilleas Pipinellis <axil archlinux gr>

pkgname=kamaki
pkgver=0.16
pkgrel=1
pkgdesc="A command-line tool for managing clouds"
arch=(any)
url="https://github.com/grnet/kamaki"
license=('BSD')
depends=('python2-objpool' 'python2-progress' 'python2-dateutil' 'astakosclient')
makedepends=('python2-distribute' 'python2-sphinx')
optdepends=('python2-ansicolors: for color support')
source=("https://pypi.python.org/packages/source/k/$pkgname/$pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Build documentation and man page
  cd "$srcdir/$pkgname-$pkgver/docs"
  sed -i 's/sphinx-build/sphinx-build2/' Makefile
  make html && make man && rm -rf "_build/html/man" && rm -rf  _build/doctrees

  mkdir -p "$pkgdir"/usr/share/{man/man1,docs/"$pkgname"}
  install -Dm644 _build/man/*.1 "$pkgdir/usr/share/man/man1/"
  cp -r _build/html/ "$pkgdir/usr/share/docs/$pkgname/html"
}
sha512sums=('fa336a199b63580d1a773129f6cf4287d6f547307bb2123a2f5c8710c066a2f2432288bc47b09601941c79d6c721de888f80aea9a1936f207e1e51b500d8add5')
