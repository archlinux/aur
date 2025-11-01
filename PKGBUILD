# Maintainer: Cypher-Monarch <monarchcypher@gmail.com>
pkgname=chrona-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Cross-platform text-to-speech and MP3 converter with a modern GUI"
arch=('x86_64')
url="https://github.com/Cypher-Monarch/Chrona"
license=('custom')
depends=('ffmpeg' 'espeak-ng')
provides=('chrona')
conflicts=('chrona')
source=("https://github.com/Cypher-Monarch/Chrona/releases/download/v${pkgver}/Chrona-linux-v${pkgver}.tar.xz")
sha256sums=('SKIP')

package() {
  # main install directory
  install -d "$pkgdir/opt/Chrona"
  install -Dm755 "$srcdir/Chrona-linux-v$pkgver/chrona.elf" "$pkgdir/opt/Chrona/chrona.elf"
  install -Dm644 "$srcdir/Chrona-linux-v$pkgver/Chrona.png" "$pkgdir/opt/Chrona/Chrona.png"

  # launcher script
  install -d "$pkgdir/usr/bin"
  echo '#!/bin/bash' >"$pkgdir/usr/bin/chrona"
  echo 'exec /opt/Chrona/chrona.elf "$@"' >>"$pkgdir/usr/bin/chrona"
  chmod +x "$pkgdir/usr/bin/chrona"

  # desktop entry
  install -d "$pkgdir/usr/share/applications"
  cat >"$pkgdir/usr/share/applications/chrona.desktop" <<EOF
[Desktop Entry]
Name=Chrona
Exec=/opt/Chrona/chrona.elf
Icon=/opt/Chrona/Chrona.png
Type=Application
Categories=AudioVideo;Utility;Education;
Comment=Convert PDFs, DOCX, and text files into speech or MP3
EOF
}
