pkgname=mpf3
pkgver=5.10.038
pkgrel=1
pkgdesc='Local and network music player/control point with UPnP/DLNA, SMB and gapless playback'
arch=('any')
url='https://penguiner.eu/'
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'gtk3' 'webkit2gtk-4.1' 'samba' 'avahi' 'nss-mdns' 'zenity' 'ffmpeg' 'python-mutagen' 'python-smbprotocol')
source=("https://penguiner.eu/planetmpf3/downloads/mpf3-${pkgver}.tar.gz")
sha256sums=('11f37fe8c005d64fdb7fa0e58d2d3793a7c24d53430dd41b576d32074f676ce8')

package() {
  cd "$srcdir/mpf3-$pkgver"
  install -d "$pkgdir/usr/share/mpf3" "$pkgdir/usr/bin"
  cp -a mp3f.py mp3f_gtk.py fredplayer_stitch_engine_v0_3.py assets "$pkgdir/usr/share/mpf3/"
  install -Dm755 run-mp3f.sh "$pkgdir/usr/share/mpf3/run-mp3f.sh"
  install -Dm755 run-mp3f-browser.sh "$pkgdir/usr/share/mpf3/run-mp3f-browser.sh"
  install -Dm644 assets/mpf3-512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/mpf3.png"
  install -Dm644 assets/mpf3-256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/mpf3.png"
  install -Dm644 assets/mpf3-128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/mpf3.png"
  install -Dm644 assets/mpf3-64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/mpf3.png"
  cat > "$pkgdir/usr/bin/mpf3" <<'EOS'
#!/usr/bin/env bash
exec /usr/bin/python /usr/share/mpf3/mp3f_gtk.py ""
EOS
  chmod 755 "$pkgdir/usr/bin/mpf3"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/mpf3.desktop" <<'EOS'
[Desktop Entry]
Type=Application
Name=MPF³
Comment=Bibliothèque musicale et Control Point réseau
Exec=mpf3
Icon=mpf3
Terminal=false
Categories=AudioVideo;Audio;Player;
StartupNotify=true
EOS
}
