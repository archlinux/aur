pkgver=1.0.3
pkgrel=1
arch=('any')
url="https://github.com/FoxyIsCoding/illogical-updots"
license=('custom')
depends=('python' 'git' 'adwaita-icon-theme' 'gdk-pixbuf2' 'librsvg')
optdepends=('papirus-icon-theme: optional icon theme')
source=()
sha256sums=()

prepare() {
  # Clone the main branch of the repo into the srcdir
  git clone --depth 1 https://github.com/FoxyIsCoding/illogical-updots.git "$srcdir/illogical-updots"
}

package() {
  # Extract all files from the cloned repo to the package folder
  mkdir -p "$pkgdir/usr/share/illogical-updots"
  cp -r "$srcdir/illogical-updots/"* "$pkgdir/usr/share/illogical-updots/"

  # Install python executable script
  install -Dm755 "$pkgdir/usr/share/illogical-updots/app.py" "$pkgdir/usr/bin/illogical-updots"

  # Install icon
  install -Dm644 "$pkgdir/usr/share/illogical-updots/.github/assets/logo.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/illogical-updots.png"

  # Install desktop entry
  mkdir -p "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/illogical-updots.desktop" <<EOF
[Desktop Entry]
Name=illogical-updots
Comment=Git updates & console installer for your dotfiles
Exec=illogical-updots
Icon=illogical-updots
Terminal=false
Type=Application
Categories=Utility;System;
StartupWMClass=illogical-updots
X-GNOME-UsesNotifications=true
EOF
}
