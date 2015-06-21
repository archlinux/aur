# Contributor: Yaohan Chen <yaohan.chen@gmail.com>
# modelled after the dofus AUR package by robb_force
pkgname=defenders-quest-demo
pkgver=1.0.1
pkgrel=2
pkgdesc='A Tower Defense / RPG hybrid that focuses on story, customization, and tactics.'
url='http://www.defendersquest.com/'
license=("custom")
arch=('i686' 'x86_64')
# LICENSE.txt copied from http://www.defendersquest.com/eula.html
source=(
http://www.defendersquest.com/files/defenders_quest_demo_1_0_1_linux/defenders_quest_demo_1_0_1.tar.gz
air-generic-launcher.sh
LICENSE.txt)
depends=('adobe-air-sdk')
md5sums=(
'87b37cdb3338b30c86f16a3c34906de6'
'f179eaa5e6e6674b1853cf826fc33c3a'
'0a762badadf7f3827cc300f3ac21fdda')

package() {
  install_dir="opt/$pkgname"
  mkdir -p "$pkgdir/$install_dir"

  cd $srcdir/DefendersQuestDemo
  cp -R share "$pkgdir/$install_dir"
  rm -rf "$pkgdir/$install_dir/share/NativeApps/"{Mac,Windows}

  mkdir -p "$pkgdir/$install_dir/bin"
  install "$srcdir/air-generic-launcher.sh" "$pkgdir/$install_dir/bin/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/$install_dir/bin/$pkgname" "$pkgdir/usr/bin/"
  

  mkdir -p "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=Defender's Quest Demo
GenericName=Defender's Quest Demo
Comment=Defender's Quest Demo
Icon=/$install_dir/share/icons/icon48.png
Exec=/$install_dir/bin/$pkgname
Path=/$install_dir/share
Categories=Game;RolePlaying
EOF

  mkdir -p "$pkgdir/usr/share/licenses/defenders-quest-demo"
  install -t "$pkgdir/usr/share/licenses/defenders-quest-demo" "$srcdir/LICENSE.txt"
}
# vim:set ts=2 sw=2 et:
