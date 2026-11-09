# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: tee < teeaur at duck dot com >

pkgname=angelscript
pkgver=2.39.0
pkgrel=1
pkgdesc="An extremely flexible cross-platform scripting library."
arch=(x86_64)
url="https://angelcode.com/angelscript"
license=('custom:ZLIB')
depends=('glibc' 'libgcc' 'libstdc++')
source=("$url/sdk/files/${pkgname}_${pkgver}.zip" https://github.com/anjo76/angelscript/raw/master/LICENSE.md)
b2sums=('2b52a08998bd2394af13dbe938a619fcc67d2cab19fbd0ec72189d8f541496630742fa6b002212ac027eb190c53de1be21fbd40e9174fc6fb8ee5171563edd5a'
        'bcab96ba1bcbb031adf29dc246cb83a21093aa446131c753836d46926102d0aeb2c428cd422b92a029e9be206543191ba460ae83f80107a219061ab3cdffe13c')

build() {
  cd "sdk/angelscript/projects/gnuc"
  make all
}

package() {
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  cd "sdk/angelscript/projects/gnuc"

  install -d "$pkgdir"/usr/share/{$pkgname,doc/$pkgname}

  make PREFIX="/usr" DESTDIR="$pkgdir" install

  msg "Installing add-ons..."
  cd "$srcdir/sdk"
  cp -rf add_on "$pkgdir/usr/share/$pkgname/"

  msg "Installing documentation and license..."
  cd "$srcdir/sdk/docs"
  cp -rf * "$pkgdir/usr/share/doc/$pkgname/"
}
