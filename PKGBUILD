# Maintainer: Rainu <ask-mai@raysha.de>

pkgname=ask-mai
pkgver=0.21.0
pkgrel=150
pkgdesc="A little, scriptable and powerful UI-Chat-Application for asking Gen-AI"
arch=('x86_64')
url="https://github.com/rainu/ask-mai"
license=('MIT')
provides=('ask-mai')
conflicts=('ask-mai')
depends=('webkit2gtk')
options=('!strip')
source=("$pkgname-binary-$pkgver::https://github.com/rainu/ask-mai/releases/download/v$pkgver/ask-mai-linux-amd64")
sha256sums=('SKIP')

package() {
  cd "ask-mai-$pkgver"

  # Binary file
  install -Dm755 "$srcdir/$pkgname-binary-$pkgver" "$pkgdir/usr/bin/ask-mai"

  # Icon file
  install -Dm644 "build/appicon.png" "$pkgdir/usr/share/pixmaps/ask-mai.png"

  # Desktop entry
  mkdir -p "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/ask-mai.desktop" << EOF
[Desktop Entry]
Name=Ask m' AI
Comment=${pkgdesc}
Path=/usr/bin/
Exec=ask-mai
Icon=ask-mai
Type=Application
Categories=Utility;
EOF

  # Documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  # License
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
