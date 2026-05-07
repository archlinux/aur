# Maintainer: Kiru <oss@kiru.app>

pkgname=kiru-bin
pkgver=0.4.5
pkgrel=1
pkgdesc="Transcription-driven video editor"
arch=('x86_64')
url="https://kiru.app"
license=('custom')
depends=(
  'alsa-lib'
  'ffmpeg'
  'fontconfig'
  'mediainfo'
  'perl-image-exiftool'
  'ttf-ibm-plex'
  'xdg-utils'
  'zenity'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-base-libs'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugins-ugly'
  'gst-libav'
)
optdepends=('kdialog: alternative file dialog backend on KDE')
provides=('kiru')
conflicts=('kiru')
options=('!strip')
source=(
  "Kiru-${pkgver}-linux-${CARCH}-arch.tar.gz::https://releases.kiru.app/releases/linux/Kiru-${pkgver}-linux-${CARCH}-arch.tar.gz"
  'kiru.desktop'
  'kiru.png'
  'kiru.svg'
  'LICENSE'
)
sha256sums=(
  '8928d968ea81b4b5ef0c3a64f78e03f80f0f6e8d1b4c0d077246a5b59a26fcde'
  'b9ccd131ad127061eae3b05b53c566e78ca25243155c2b03bb7546e5be5defe0'
  '356ce1144dedad29ecf4a180761b83b2d826322ba25d9203c75e7570f574b364'
  '2935a0fe9651a84fded9c0fcd10122803f0935e0cd27f2d76dc96a3209af8cae'
  '8aaa0695e81583c4d560a3b900baea662eaf1fa99b4339b00ad434ebb8dc5518'
)

package() {
  install -dm755 "$pkgdir/opt/kiru"
  cp -a kiru/. "$pkgdir/opt/kiru/"

  install -Dm644 kiru.desktop "$pkgdir/usr/share/applications/kiru.desktop"
  install -Dm644 kiru.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/kiru.png"
  install -Dm644 kiru.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/kiru.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/kiru" <<'EOF'
#!/usr/bin/env bash
export KIRU_FFMPEG_PATH="${KIRU_FFMPEG_PATH:-$(command -v ffmpeg)}"
export KIRU_FFPROBE_PATH="${KIRU_FFPROBE_PATH:-$(command -v ffprobe)}"
exec /opt/kiru/AppRun "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/kiru"
}
