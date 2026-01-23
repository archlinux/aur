# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: tee < teeaur at duck dot com >

pkgname=angelscript
pkgver=2.38.0
pkgrel=1
pkgdesc="An extremely flexible cross-platform scripting library."
arch=('i686' 'x86_64')
url="http://angelcode.com/angelscript"
license=('custom:ZLIB')
depends=('gcc-libs')
source=("$url/sdk/files/${pkgname}_${pkgver}.zip" https://github.com/anjo76/angelscript/raw/refs/heads/master/LICENSE.md)
b2sums=('40600c1828641960007143a9ef5a730189dcc7c2c9121ed674889028e6ce733fd3ed5adaadae4bb8dd31785c056850cec885c17e4b5a7dfac259b8f4157bf8c7'
        'ee624592047acaa56745943bd1d2e55ffd3e155e0ae8822b60ba0edb746da5c87c57a953d4045969d15d8d8284eafa64b04b1933c5ed6f8c33f9939cd166af16')

build() {
  cd "$srcdir/sdk/angelscript/projects/gnuc"
  make all
}

package() {
  cd "$srcdir/sdk/angelscript/projects/gnuc"

  install -d "$pkgdir"/usr/share/{licenses,doc}/$pkgname \
             "$pkgdir"/usr/share/$pkgname \
             "$pkgdir"/usr/share/doc/$pkgname/articles

  make PREFIX="/usr" DESTDIR="$pkgdir" install

  msg "Installing add-ons..."
  cd "$srcdir/sdk"
  cp -rf add_on "$pkgdir/usr/share/$pkgname/"

  msg "Installing documentation and license..."
  cd "$srcdir/sdk/docs"
  cp -rf * "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname"
}
