pkgname=rune
pkgver=1.07
pkgrel=1
pkgdesc='Hack and slay game based on Norse mythology'
arch=('i686' 'x86_64')
url='http://www.lokigames.com/products/rune/'
license=('custom')
optdepends=('ossp: sound support when not using OSS natively')
install="$pkgname.install"
source=("$pkgname.desktop"
        'http://icculus.org/~ravage/rune/rune-107-fix.tar.bz2')
sha256sums=('dfd474bc0c2933a71ba1a90a94d795967f39eb7c530b03f96495b580ae0e74b8'
            'dd31076f171616f7146b8241eedae60a3b0aef7313a64ef07fd8e53d1df20b79')

package() {
  install -d "$pkgdir/opt/$pkgname/Help" "$pkgdir/opt/$pkgname/Maps" "$pkgdir/opt/$pkgname/Meshes" "$pkgdir/opt/$pkgname/Sounds" "$pkgdir/opt/$pkgname/System" "$pkgdir/opt/$pkgname/Textures" "$pkgdir/opt/$pkgname/Web/images"

  install -Dm 644 rune.desktop "$pkgdir/usr/share/applications/rune.desktop"

  msg2 "Please type absolute path to mounted Rune CD (e.g. /media/cdrom)"
  read rune_cd
  mkdir -p "$srcdir/rune"
  cd "$srcdir/rune"
  tar xf "$rune_cd/data.tar.gz"
  install -m 644 Help/* "$pkgdir/opt/$pkgname/Help"
  install -m 644 Maps/*.run "$pkgdir/opt/$pkgname/Maps"
  install -m 644 Meshes/*.ums "$pkgdir/opt/$pkgname/Meshes"
  install -m 644 Sounds/*.uax "$pkgdir/opt/$pkgname/Sounds"
  install -m 644 System/*.{ini,int,u,url} "$pkgdir/opt/$pkgname/System"
  install -m 644 Textures/*.utx "$pkgdir/opt/$pkgname/Textures"
  install -m 644 Web/*.uhtm "$pkgdir/opt/$pkgname/Web"
  install -m 644 Web/images/* "$pkgdir/opt/$pkgname/Web/images"

  cd "$rune_cd"
  install -D -m 644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m 644 CREDITS Legal.txt License.txt README icon.bmp icon.xpm "$pkgdir/opt/$pkgname"
  install -m 644 System/*.* "$pkgdir/opt/$pkgname/System"
  install -m 755 System/{rune-bin,ucc,ucc-bin} "$pkgdir/opt/$pkgname/System"
  install -m 755 bin/x86/rune "$pkgdir/opt/$pkgname"

  cd "$srcdir"
  install -m 644 RMenu.* "$pkgdir/opt/$pkgname/System"
}

# vim:set ts=2 sw=2 et:
