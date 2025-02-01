pkgname=ytdt-gui
pkgver=1.1.0
pkgrel=1
pkgdesc="A YouTube downloader written in Tauri and React"
arch=('x86_64')
url="https://github.com/posaidon09/ytdt-gui"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')

source_x86_64=("https://github.com/posaidon09/ytdt-gui/releases/download/"$pkgver"/"$pkgname"_"$pkgver"_amd64.deb")
sha256sums_x86_64=('a3f50e1899825d098ed33e40d1d311ced7fad8e3c9329019f8b02b66e81ae3ad')

package() {
  cd "$srcdir"
  ar x ytdt-gui_1.0.0_amd64.deb
  tar xf data.tar.* -C "$pkgdir"

  rm -f "$pkgdir/usr/bin/script"

  install -Dm755 "$pkgdir/usr/bin/ytdt-gui" "$pkgdir/opt/ytdt-gui/ytdt-gui"
  ln -sf "/opt/ytdt-gui/ytdt-gui" "$pkgdir/usr/bin/ytdt-gui"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/ytdt-gui.desktop" <<EOF
[Desktop Entry]
Name=YTDT-GUI
Comment=YouTube Downloader
Exec=/opt/ytdt-gui/ytdt-gui
Icon=ytdt-gui
Terminal=false
Type=Application
Categories=Utility;Network;
StartupWMClass=ytdt-gui
EOF

}
