# maintainer: meowcat <at> meowcat.site
pkgname=shiori-reader
pkgver=0.5
pkgrel=1
pkgdesc="Shiori - A simple MangaDex-based manga reader"
arch=('any')
url="https://github.com/meowcat767/Shiori"
license=('MIT')
depends=('java-runtime')
source=("shiori.jar::https://files.meowcat.site/aur-files/shiori/0.5/shiori.jar")
sha256sums=('SKIP') # will replace with a real hash on 1.0 release.

package() {
  # JAR location
  install -Dm644 shiori.jar "$pkgdir/usr/share/shiori/shiori.jar"

  # Launcher script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/shiori" << 'EOF'
#!/bin/sh
exec java -jar /usr/share/shiori/shiori.jar "$@"
EOF

  # Desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/shiori.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=Shiori
Comment=A simple MangaDex-based manga reader
Exec=shiori
Icon=shiori
Terminal=false
Categories=Utility;Java;Internet
EOF
}
