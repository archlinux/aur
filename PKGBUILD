# Maintainer: Michael Moroni <michael.moroni at openmailbox dot org>

pkgname=cacaoweb-bin
pkgver=1.2.0.3
pkgrel=11
pkgdesc="Watch, share and host videos and files online with no limits."
arch=('i686' 'x86_64')
url="http://www.cacaoweb.org/"
license=('custom:UNLICENSE')
depends=('firefox')
provides=('cacaoweb')
conflicts=('cacaoweb')
[ "$CARCH" = 'x86_64' ] && _arc=64
source=("${url}download/cacaoweb.linux$_arc"
        "http://unlicense.org/UNLICENSE")
md5sums=('SKIP'
         '7246f848faa4e9c9fc0ea91122d6e680')

package() {
  # bin
  install -Dm755 "$srcdir/cacaoweb.linux$_arc" "$pkgdir/usr/bin/cacaoweb"

  # license
  install -Dm644 "$srcdir/UNLICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # "Couldn't load XPCOM." hard fix
  install -d "$pkgdir/usr/local"
#  ln -s /usr/lib/firefox/libxpcom.so "$pkgdir/usr/local"
#  ln -s /usr/lib/firefox/application.ini "$pkgdir/usr/local"
  ln -s /usr/lib/firefox/libxul.so "$pkgdir/usr/local"
  ln -s /usr/lib/firefox/dependentlibs.list "$pkgdir/usr/local"
  ln -s /usr/lib/firefox/libmozalloc.so "$pkgdir/usr/local"
}
