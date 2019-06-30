# Previous Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=angelscript
pkgver=2.33.0
pkgrel=2
pkgdesc="An extremely flexible cross-platform scripting library."
arch=('i686' 'x86_64')
url="http://angelcode.com/angelscript/"
license=('custom:ZLIB')
depends=('gcc-libs')
source=("http://angelcode.com/angelscript/sdk/files/${pkgname}_${pkgver}.zip"
        LICENSE)
sha512sums=('eaf972ecf965fe4f72e55755f5e796499018e918f93cfd835b1ca20f9338e299e8dbd707240341eef81ae920f07d2280646151f515f5990a62550689445c86f0'
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
