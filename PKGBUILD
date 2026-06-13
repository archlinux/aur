# Maintainer: Evilleader evilleader91@gmail.com

pkgname=optiscaler-client-bin
pkgver=1.0.5
pkgrel=1
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
  "optiscaler-icon-256.png::https://raw.githubusercontent.com/NasirA1991/aur-optiscaler-client/main/icon256.png"
  "optiscaler-icon-128.png::https://raw.githubusercontent.com/NasirA1991/aur-optiscaler-client/main/icon128.png"
  "optiscaler-client.desktop"
)

sha256sums=('PLACEHOLDER' 'SKIP' 'SKIP' 'SKIP')

package() {
  mkdir -p "$pkgdir/opt/optiscaler-client"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps"

  bsdtar -xf optiscaler-client.zip -C "$pkgdir/opt/optiscaler-client"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/optiscaler-client" << 'EOF'
#!/bin/bash
exec /opt/optiscaler-client/OptiscalerClient "$@"
EOF

  install -Dm644 optiscaler-client.desktop \
    "$pkgdir/usr/share/applications/optiscaler-client.desktop"

  install -Dm644 optiscaler-icon-256.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/optiscaler-client.png"

  install -Dm644 optiscaler-icon-128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/optiscaler-client.png"
}
