# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=alfae-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="An Itch.io/Epic Games/GOG launcher that works through plugins (binary release)"
arch=('x86_64')
url="https://github.com/suchmememanyskill/Alfae"
license=('GPL3')
provides=("alfae")
conflicts=("alfae")
options=('!strip')
source=("alfae-$pkgver.zip::$url/releases/download/$pkgver/Linux.zip"
        "$url/raw/$pkgver/Launcher/Assets/icon.png")
sha256sums=('34ba351c4aead498e2778d67d6fe01ce1e19723fb4a92dfd0611bbd230b29191'
            'SKIP')

prepare() {
  # Create a shortcut
  echo "Categories=Game;" >> desktop
  sed -i '1 i\Comment=An Itch.io/Epic Games/GOG launcher that works through plugins' desktop
  sed -i '1 i\StartupWMClass=Alfae' desktop
  sed -i '1 i\Icon=alfae' desktop
  sed -i '1 i\Type=Application' desktop
  sed -i '1 i\Terminal=false' desktop
  sed -i '1 i\Exec=/opt/Alfae/Alfae %U' desktop
  sed -i '1 i\Name=Alfae' desktop
  sed -i '1 i\[Desktop Entry]' desktop
  mv desktop alfae.desktop
}

package() {
  # Create folders
  mkdir -p "$pkgdir/opt/Alfae" "$pkgdir/usr/bin"
  # Install
  mv Release/* "$pkgdir/opt/Alfae"
  ln -s /opt/Alfae/Alfae $pkgdir/usr/bin/alfae
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/alfae.png"
  install -Dm644 alfae.desktop -t "$pkgdir/usr/share/applications"
}
