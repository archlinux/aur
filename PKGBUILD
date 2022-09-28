# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=angelscript
pkgver=2.36.0
pkgrel=1
pkgdesc="An extremely flexible cross-platform scripting library."
arch=('i686' 'x86_64')
url="http://angelcode.com/angelscript/"
license=('custom:ZLIB')
depends=('gcc-libs')
source=("http://angelcode.com/angelscript/sdk/files/${pkgname}_${pkgver}.zip"
        LICENSE)
sha512sums=('afd2b9096d0b62bc3d182d684fe34ddc8e9520af7734eea1f1a5c7d3439a28a1be7502faf692080cb0c4591799b7fea09fc8c4ccf25b8ec63a3d306e678682ff'
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
