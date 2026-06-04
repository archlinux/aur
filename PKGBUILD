# Maintainer: Evilleader evilleader91@gmail.com

pkgname=optiscaler-client-bin
pkgver=1.0.5
pkgrel=10
pkgdesc="Modern desktop client for installing, updating and configuring OptiScaler across game libraries"
arch=('x86_64')
url="https://github.com/Agustinm28/Optiscaler-Client"
license=('MIT')

depends=('glibc' 'gcc-libs')

provides=('optiscaler-client')
conflicts=('optiscaler-client')

options=(!strip)

source=(
  "optiscaler-client.zip::https://github.com/Agustinm28/Optiscaler-Client/releases/download/OptiscalerClient-${pkgver}/OptiscalerClient-${pkgver}-linux-x64.zip"
  "optiscaler-icon.png::https://raw.githubusercontent.com/Agustinm28/Optiscaler-Client/main/assets/icon.png"
  "optiscaler-client.desktop"
)

sha256sums=('SKIP' 'SKIP')

package() {
  mkdir -p "$pkgdir/opt/optiscaler-client"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  # IMPORTANT: unzip preserves structure better for this type of app
  bsdtar -xf optiscaler-client.zip -C "$pkgdir/opt/optiscaler-client"

  # DO NOT cd tricks unless needed
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/optiscaler-client" << 'EOF'
#!/bin/bash
exec /opt/optiscaler-client/OptiscalerClient "$@"
EOF

  install -Dm644 optiscaler-client.desktop \
    "$pkgdir/usr/share/applications/optiscaler-client.desktop"

  install -Dm644 "optiscaler-icon.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/optiscaler-client.png"

  install -Dm644 "optiscaler-icon.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/optiscaler-client.png"
}
