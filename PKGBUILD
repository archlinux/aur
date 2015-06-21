# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
pkgname=defenders-quest
pkgver=1.1.46
pkgrel=1
pkgdesc='A Tower Defense / RPG hybrid that focuses on story, customization, and tactics. (requires full copy of game)'
url='http://www.defendersquest.com/'
license=("custom")
arch=('i686' 'x86_64')

# LICENSE.txt copied from http://www.defendersquest.com/eula.html
source=("hib://defenders_quest_${pkgver//./_}.tar.gz"
        'air-generic-launcher.sh'
        'LICENSE.txt')
depends=('adobe-air-sdk')

md5sums=('6a634f9576f0c08b7a4b8c654a0ee3b7'
         'f179eaa5e6e6674b1853cf826fc33c3a'
         '0a762badadf7f3827cc300f3ac21fdda')

package() {
  _install_dir="opt/$pkgname"
  mkdir -p "$pkgdir/$_install_dir"

  cd $srcdir
  cp -R share "$pkgdir/$_install_dir"
  rm -rf "$pkgdir/$_install_dir/share/NativeApps/"{Mac,Windows}

  install -Dm755 "$srcdir/air-generic-launcher.sh" "$pkgdir/$_install_dir/bin/$pkgname"
  _bin_path="$pkgdir/usr/bin"
  install -d "$_bin_path"
  ln -s "/$_install_dir/bin/$pkgname" "$_bin_path/$pkgname"

  mkdir -p "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=Defender's Quest
GenericName=Defender's Quest
Comment=Defender's Quest
Icon=/$_install_dir/share/icons/icon48.png
Exec=/$_install_dir/bin/$pkgname
Path=/$_install_dir/share
Categories=Game;RolePlaying
EOF

  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
