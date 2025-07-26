# Maintainer: Tom Brown <tom@CarlsonSpeed.com>
# Contributor: ChatGPT by OpenAI (https://openai.com/)
pkgname=videokit-kde
pkgver=0.3.0
pkgrel=1
pkgdesc="KDE video utility suite that extends Dolphin context menus for transcoding, metadata, etc."
arch=('any')
url="https://github.com/TomB16/videokit-kde"
license=('GPL3')
depends=('ffmpeg' 'mediainfo' 'bash' 'crudini' 'bashdev')
makedepends=('git')
source=("git+https://github.com/TomB16/videokit-kde.git#branch=master")
sha256sums=('SKIP')

# Optional: Auto-generate pkgver from Git describe, if you tag versions
# pkgver() {
#   cd "$srcdir/$pkgname"
#   git describe --tags | sed 's/^v//;s/-/./g'
# }

package() {
  cd "$srcdir/$pkgname" || exit 1

  # Install scripts
  install -d "$pkgdir/usr/bin"
  for f in src/*; do
    install -m755 "$f" "$pkgdir/usr/bin/"
  done

  # Install .desktop service menu
  install -Dm644 "videokit.desktop" "$pkgdir/usr/share/kio/servicemenus/videokit.desktop"

  # Install icons
  install -Dm644 "transcode.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/transcode.svg"
  install -Dm644 "transcode.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/transcode.svg"
  install -Dm644 "videokit.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/videokit.svg"
  install -Dm644 "videokit.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/videokit.svg"

  # Install default config
  install -Dm644 "videokit.conf" "$pkgdir/usr/share/videokit/videokit.conf"

  # Install Transcode log spreadsheet
  install -Dm644 "Transcode Log Analysis v0.01.ods" "$pkgdir/usr/share/videokit/Transcode/Transcode Log Analysis v0.01.ods"

  # Install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
