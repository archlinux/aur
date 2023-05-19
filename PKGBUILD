# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=alfae
pkgname=$_pkgname-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="An Itch.io/Epic Games/GOG launcher that works through plugins (binary release)"
arch=('x86_64')
url="https://github.com/suchmememanyskill/Alfae"
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
_desktop=alfae.desktop
_url2=https://raw.githubusercontent.com/suchmememanyskill/Alfae/$_commit
_commit=7258cb358497197d1ffd35e3289455b2323fe81a
source=("$url/releases/download/$pkgver/Linux.zip"
        "$_url2/Launcher/Assets/icon.png"
        "$_url2/README.md"
        "$_url2/LICENSE")
sha256sums=('33027a73c17561776e938f9b7c5ca83a8a3a0d3bf000e147dbe60b7d0996c4e9'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  # Create a shortcut
  echo "Categories=Game;" >> $_desktop
  sed -i '1 i\Comment=An Itch.io/Epic Games/GOG launcher that works through plugins' $_desktop
  sed -i '1 i\StartupWMClass=Alfae' $_desktop
  sed -i '1 i\Icon=alfae' $_desktop
  sed -i '1 i\Type=Application' $_desktop
  sed -i '1 i\Terminal=false' $_desktop
  sed -i '1 i\Exec=/opt/Alfae/Alfae %U' $_desktop
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
