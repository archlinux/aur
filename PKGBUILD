# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=alfae-bin
pkgver=1.4.3
pkgrel=1
pkgdesc="An Itch.io/Epic Games/GOG launcher that works through plugins (binary release)"
url="https://github.com/suchmememanyskill/Alfae"
license=('GPL-3.0-or-later')
arch=('x86_64')
provides=("alfae")
conflicts=("alfae")
options=('!strip')
source=("alfae-$pkgver.zip::$url/releases/download/$pkgver/Linux.zip"
        "$url/raw/$pkgver/Launcher/Assets/icon.png")
sha256sums=('15b2e23fd61a304d4883ff43309f288ed713838d2caeb1201adfb2500ac2a1e9'
            '776e6aa9151e508ecd2dc2a54bfa8f149974e96b945371c112befdd97e370a9b')

prepare() {
# Create a shortcut
  echo -e "[Desktop Entry]\n\
Name=Alfae\n\
Icon=alfae\n\
Exec=/opt/Alfae/Alfae %U\n\
Terminal=false\n\
Type=Application\n\
StartupWMClass=Alfae\n\
Comment=An Itch.io/Epic Games/GOG launcher that works through plugins\n\
Categories=Game;" > alfae.desktop
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
