pkgname=rune-hov
pkgver=1.08
pkgrel=1
pkgdesc='Hack and slay game based on Norse mythology'
arch=('i686' 'x86_64')
url='http://www.lokigames.com/products/rune/'
license=('custom')
optdepends=('ossp: sound support when not using OSS natively')
install="$pkgname.install"
source=("$pkgname.desktop"
        'http://icculus.org/~ravage/rune/rune-107-fix.tar.bz2'
        'rhov108upd_linux.zip::http://www.rune-library.com/e107/request.php?15')
sha256sums=('9a30a55dcbfc960c7aee8c9742b928a9fcd3a926dc9e192a43597c5f5673ea65'
            'dd31076f171616f7146b8241eedae60a3b0aef7313a64ef07fd8e53d1df20b79'
            'f38d5d6e463db92bb9a66a27a51480d7c143be139d9234458b9e17beff8fb341')

package() {
  install -d "$pkgdir/opt/$pkgname/Help" "$pkgdir/opt/$pkgname/Maps" "$pkgdir/opt/$pkgname/Meshes" "$pkgdir/opt/$pkgname/Sounds" "$pkgdir/opt/$pkgname/System" "$pkgdir/opt/$pkgname/Textures" "$pkgdir/opt/$pkgname/Web/images"

  install -Dm 644 rune-hov.desktop "$pkgdir/usr/share/applications/rune-hov.desktop"

  # extract Rune
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

  # apply 1.07 fix
  cd "$srcdir"
  install -m 644 RMenu.* "$pkgdir/opt/$pkgname/System"

  # extract Rune: Halls of Valhalla
  msg2 "Please type absolute path to mounted Rune HoV CD (e.g. /media/cdrom)"
  read hov_cd
  mkdir -p "$srcdir/hov"
  cd "$srcdir/hov"
  tar xf "$hov_cd/data-HOV.tar.gz"
  install -m 644 Maps/*.run "$pkgdir/opt/$pkgname/Maps"
  install -m 644 Sounds/*.uax "$pkgdir/opt/$pkgname/Sounds"
  install -m 644 System/*.{int,u} "$pkgdir/opt/$pkgname/System"
  install -m 644 Textures/*.utx "$pkgdir/opt/$pkgname/Textures"

  cd "$hov_cd"
  install -m 644 README-HOV "$pkgdir/opt/$pkgname"

  # apply 1.08 patch
  cd "$srcdir"
  install -m 644 *.u *.int "$pkgdir/opt/$pkgname/System"
  install -m 644 *.ums "$pkgdir/opt/$pkgname/Meshes"
  install -m 644 Maps/*.run "$pkgdir/opt/$pkgname/Maps"
  install -m 644 Textures/*.utx "$pkgdir/opt/$pkgname/Textures"
  install -m 644 Web/*.uhtm "$pkgdir/opt/$pkgname/Web"
  install -m 644 Web/images/* "$pkgdir/opt/$pkgname/Web/images"
}

# vim:set ts=2 sw=2 et:
