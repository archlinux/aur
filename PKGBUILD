# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=cliaspora
pkgver=0.1.9.1
pkgrel=1
pkgdesc="A command-line client for Diaspora*"
arch=('i686' 'x86_64')
url="http://freeshell.de/~mk/projects/cliaspora.html"
license=('BSD')
depends=('openssl')
source=(http://freeshell.de/~mk/download/$pkgname-$pkgver.tgz)
sha1sums=('78eb99d72aea8dcb9d96f2e56ee4ac5e7f85aadf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make

  sed -n '/Copyright/,/SUCH DAMAGE/p' cliaspora.c > LICENSE &&
    sed -i 's/^ \* //;s/^ \*//' LICENSE
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
