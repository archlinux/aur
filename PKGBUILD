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
  echo -e "[Desktop Entry]\n\
Name=Alfae\n\
Exec=/opt/Alfae/Alfae %U\n\
Terminal=false\n\
Type=Application\n\
Icon=alfae\n\
StartupWMClass=Alfae\n\
Comment=An Itch.io/Epic Games/GOG launcher that works through plugins\n\
Categories=Game;" > desktop
  mv desktop alfae.desktop
}

package() {
# Create directories
  mkdir -p "$pkgdir/opt/Alfae" "$pkgdir/usr/bin"
# Install
  mv Release/* "$pkgdir/opt/Alfae"
  ln -s /opt/Alfae/Alfae $pkgdir/usr/bin/alfae
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/alfae.png"
  install -Dm644 alfae.desktop -t "$pkgdir/usr/share/applications"
}
