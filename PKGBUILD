# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >

pkgname=angelscript-2.31.2
pkgver=2.31.2
pkgrel=1
pkgdesc="An extremely flexible cross-platform scripting library. - Specific version for Rigs of Rods"
arch=('i686' 'x86_64')
url="https://angelcode.com/angelscript/"
license=('custom:ZLIB')
depends=('gcc-libs')
conflicts=("angelscript")
source=("http://angelcode.com/angelscript/sdk/files/angelscript_$pkgver.zip"
        LICENSE)
sha512sums=('4dd4c64caf4fc66a9fbda55d0fb81b91a6af5f5d4f28728343ff06455418ebaf5a36895e04e0bc2aebd76b510e81357f7e0ffd7e575b49bbc9573c106f24b265'
            '523a6ded94dab26ebc1fc5ed39346b950afea1dae1a51c5f262242de1ad86ce921d462b430825bd7a0ca7bb2d501b85e60f39732c3e1d948e1f0182cc9c691a1')

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
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
