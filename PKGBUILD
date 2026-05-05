# Maintainer: Kiru <support@getkiru.app>

pkgname=kiru-bin
pkgver=0.4.3
pkgrel=3
pkgdesc="Transcription-driven video editor"
arch=('x86_64')
url="https://getkiru.app"
license=('custom')
depends=('fuse2' 'ffmpeg' 'fontconfig' 'ttf-ibm-plex' 'xdg-utils')
provides=('kiru')
conflicts=('kiru')
options=('!strip')
source=(
  "Kiru-${pkgver}-x86_64.AppImage::https://releases.getkiru.app/releases/linux/Kiru-0.4.3-x86_64.AppImage"
  'kiru.desktop'
  'kiru.png'
  'kiru.svg'
  'LICENSE'
)
sha256sums=(
  '6e857c237271a3d465b9534f1aa6c832e96747312598f25cffa0860cee14b9cf'
  'b9ccd131ad127061eae3b05b53c566e78ca25243155c2b03bb7546e5be5defe0'
  '356ce1144dedad29ecf4a180761b83b2d826322ba25d9203c75e7570f574b364'
  '2935a0fe9651a84fded9c0fcd10122803f0935e0cd27f2d76dc96a3209af8cae'
  '8aaa0695e81583c4d560a3b900baea662eaf1fa99b4339b00ad434ebb8dc5518'
)

package() {
  install -Dm755 "Kiru-${pkgver}-x86_64.AppImage" "$pkgdir/opt/kiru/Kiru.AppImage"
  install -Dm644 kiru.desktop "$pkgdir/usr/share/applications/kiru.desktop"
  install -Dm644 kiru.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/kiru.png"
  install -Dm644 kiru.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/kiru.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/kiru" <<'EOF'
#!/usr/bin/env bash
export KIRU_FFMPEG_PATH="${KIRU_FFMPEG_PATH:-$(command -v ffmpeg)}"
export KIRU_FFPROBE_PATH="${KIRU_FFPROBE_PATH:-$(command -v ffprobe)}"
exec /opt/kiru/Kiru.AppImage "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/kiru"
}
