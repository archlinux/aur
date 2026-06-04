# Maintainer: Evilleader evilleader91@gmail.com

pkgname=optiscaler-client-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="Modern desktop client for installing, updating and configuring OptiScaler across game libraries"
arch=('x86_64')
url="https://github.com/Agustinm28/Optiscaler-Client"
license=('MIT')

depends=(
  'glibc'
  'gcc-libs'
)

provides=('optiscaler-client')
conflicts=('optiscaler-client')

source=(
  "optiscaler-client.tar.gz::https://github.com/Agustinm28/OptiScaler-Client/releases/download/v${pkgver}/OptiscalerClient-${pkgver}-linux-x64.tar.gz"
  "optiscaler-client.desktop"
)

sha256sums=('SKIP' 'SKIP')

package() {
  mkdir -p "$pkgdir/opt/optiscaler-client"
  mkdir -p "$pkgdir/usr/bin"

  bsdtar -xf optiscaler-client.tar.gz -C "$pkgdir/opt/optiscaler-client" --strip-components=1

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/optiscaler-client" << 'EOF'
#!/bin/bash
exec /opt/optiscaler-client/OptiscalerClient "$@"
EOF

  # Desktop entry
  install -Dm644 optiscaler-client.desktop \
    "$pkgdir/usr/share/applications/optiscaler-client.desktop"

  # Install icon if upstream ships one
  if [ -f "$pkgdir/opt/optiscaler-client/icon.png" ]; then
    install -Dm644 \
      "$pkgdir/opt/optiscaler-client/icon.png" \
      "$pkgdir/usr/share/pixmaps/optiscaler-client.png"
  fi
}
