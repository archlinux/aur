# Maintainer: Mylloon <kennel.anri@tutanota.com>

# shellcheck disable=SC2034,SC2148,SC2154

pkgname='dsr'
pkgver=1.15.0
pkgrel=1
pkgdesc="Video compression tool"
arch=('x86_64')
url=https://git.mylloon.fr/Anri/dsr
license=('AGPL3')
provides=("$pkgname")
conflicts=("$pkgname")
optdepends=('ffmpeg: needed for some encoders')
source_x86_64=("$pkgname.zip::https://git.mylloon.fr/Anri/dsr/releases/download/$pkgver/dsr-linux-x64-$pkgver.zip"
               "https://git.mylloon.fr/Anri/dsr/raw/branch/main/image/icon.png")
sha256sums_x86_64=("SKIP"
                   "SKIP")

package() {
  # Install full app to /opt
  install -d "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/dsr-linux-x64"/* "$pkgdir/opt/$pkgname"

  # Symlink the binary to /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # Desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Video Compressor
Comment=Compress video files
Exec=/usr/bin/$pkgname %F
Icon=$pkgname.png
Terminal=false
Categories=Utility;Video;
MimeType=video/mp4;video/x-matroska;video/webm;
EOF
}
