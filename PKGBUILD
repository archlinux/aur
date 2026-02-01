# Maintainer: Mylloon <aur@mylloon.fr>

# shellcheck disable=SC2034,SC2148,SC2154

pkgname='monochrome'
pkgver=2.2.0
pkgrel=1
pkgdesc="Monochrome is a lightweight, privacy-focused music streaming client designed for high-fidelity audio playback. Built with modern web technologies, it provides a clean, distraction-free listening experience."
arch=('x86_64')
url=https://github.com/SamidyFR/monochrome
license=('HIPPOCRATIC LICENSE')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=("$pkgname")
conflicts=("$pkgname")
source_x86_64=(
  "$pkgname-$pkgver.zip::https://downloads.samidy.com/Monochrome-linux.zip"
  "icon.png::https://raw.githubusercontent.com/SamidyFR/monochrome/refs/heads/main/public/assets/96.png"
)
sha256sums_x86_64=("SKIP" "SKIP")

package() {
  install -d "$pkgdir/usr/bin"
  cp "$srcdir/Monochrome" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "$srcdir/Monochrome" "$pkgdir/usr/bin/$pkgname"

  # Desktop entry
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Monochrome
GenericName=Music streaming player
Comment=Privacy-focused music streaming client
Icon=$pkgname.png
Exec=/usr/bin/$pkgname
Terminal=false
Categories=Audio;Music;Player;
EOF
}
