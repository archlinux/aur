# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=alfae
pkgname=$_pkgname-bin
pkgver=1.4.0
pkgrel=2
pkgdesc="An Itch.io/Epic Games/GOG launcher that works through plugins (binary release)"
arch=('x86_64')
url="https://github.com/suchmememanyskill/Alfae"
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
_desktop=alfae.desktop
_url2=https://raw.githubusercontent.com/suchmememanyskill/Alfae/600ce4d27bda86a2848442b5912786b6735c3664
source=("$url/releases/download/$pkgver/Linux.zip"
        "$_url2/Launcher/Assets/icon.png"
        "$_url2/README.md"
        "$_url2/LICENSE")
sha256sums=('5c7516dd44a26ca24fd31e1fd0ef572fc16999ca67ef1ff6fdb18cf4c68a1bba'
            '776e6aa9151e508ecd2dc2a54bfa8f149974e96b945371c112befdd97e370a9b'
            '18184d4f84bdfbb16d3df4d199556ce8b1988f8b20161c6b32ce033016adbcf5'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')

prepare() {
  # Create a shortcut
  echo "Categories=Game;" >> $_desktop
  sed -i '1 i\Comment=An Itch.io/Epic Games/GOG launcher that works through plugins' $_desktop
  sed -i '1 i\StartupWMClass=Alfae' $_desktop
  sed -i '1 i\Icon=alfae' $_desktop
  sed -i '1 i\Type=Application' $_desktop
  sed -i '1 i\Terminal=false' $_desktop
  sed -i '1 i\Exec=/opt/Alfae/alfae %U' $_desktop
  sed -i '1 i\Name=Alfae' $_desktop
  sed -i '1 i\[Desktop Entry]' $_desktop
  mkdir -p desktop
  mv $_desktop desktop
}

package() {
  # Create folders
  mkdir -p $pkgdir/opt
  mkdir -p $pkgdir/usr/bin
  # Install
  cp -r Release $pkgdir/opt/Alfae
  ln -s /opt/Alfae/Alfae $pkgdir/usr/bin/$_pkgname
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  install -Dm644 desktop/$_desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
