# Maintainer: Shaun Marvin S. Acenas <shaunmarvin.acenas at gmail dot com>
# Contributor: Rafael Cruz <rafaelcruz at outlook dot com>

pkgname=fightcade2-bin
_realname=fightcade2
pkgver=2.1.45
pkgrel=1
pkgdesc='The best way to play your favorite retro games with or against any other player in the world.'
arch=('x86_64')
url='https://www.fightcade.com/'
license=('MIT')
depends=('rsync' 'wine' 'wine-mono' 'lib32-mpg123' 'lib32-libxss' 'lib32-libcurl-gnutls' 'libcurl-gnutls' 'libzip' 'miniupnpc' 'lua53' 'gtk3')
makedepends=()

source=("https://web.fightcade.com/download/Fightcade-linux-latest.tar.gz"
        "fightcade2.sh")
sha256sums=('9880cbfa9b6e4a4eceab750c1d825d3c753ae4b1f84b53df421829e1423c50be'
            '0f2432a8f3c74b8ea8c768c90251bfae67e1e022528bf0a303aa0de8e38ba0b8')

package() {
  install -d "$pkgdir/opt/$_realname"
  cp -r "$srcdir/Fightcade/." "$pkgdir/opt/$_realname/"

  install -Dm755 "$srcdir/fightcade2.sh" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/Fightcade/fc2-electron/resources/app/icon.png" "$pkgdir/usr/share/pixmaps/$_realname.png"
  
  install -Dm644 "$srcdir/Fightcade/Fightcade.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  sed -i "s#^Exec=.*#Exec=/opt/$_realname/Fightcade2.sh#" "$pkgdir/usr/share/applications/${pkgname}.desktop"

  install -Dm644 "$srcdir/Fightcade/fc2-electron/LICENSE.electron" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
