pkgname=mangayomi-linux
pkgver=0.9.1
pkgrel=1
pkgdesc="Mangayomi - Manga, Anime and Novel reader (prebuilt Linux zip)"
arch=('x86_64')
url="https://github.com/kodjodevf/mangayomi"
license=('GPL3')

depends=('gtk3' 'webkit2gtk-4.1' 'mpv' 'libsoup3' 'libepoxy' 'alsa-lib' 'hicolor-icon-theme' 'cairo' 'pango' 'at-spi2-core' 'fontconfig' 'glib2' 'glibc' 'libstdc++' 'libgcc')
options=(!strip)
provides=('mangayomi')
conflicts=('mangayomi' 'mangayomi-git')

source=("https://github.com/kodjodevf/mangayomi/releases/download/v${pkgver}/Mangayomi-v${pkgver}-linux.zip")
sha256sums=('SKIP')

package() {
  # 1) directory app
  install -d "$pkgdir/opt/mangayomi"

  # 2) copia binari e dati (come mangayomi-bin)
  cp -r "$srcdir/mangayomi" "$srcdir/data" "$srcdir/lib" \
    "$pkgdir/opt/mangayomi/"

  # 3) symlink eseguibile
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/mangayomi/mangayomi" "$pkgdir/usr/bin/mangayomi"

  # 4) icona ESATTA dallo zip
  install -Dm644 \
    "$srcdir/data/flutter_assets/assets/app_icons/icon.png" \
    "$pkgdir/usr/share/pixmaps/mangayomi.png"

  # 5) desktop entry
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/mangayomi.desktop" <<EOF
[Desktop Entry]
Name=Mangayomi
Exec=mangayomi
Icon=mangayomi
Type=Application
Categories=Graphics;Viewer;
Terminal=false
EOF
}
