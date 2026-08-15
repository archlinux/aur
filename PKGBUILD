# Maintainer: mirrar-app <iknowarch@proton.me>
pkgname=dwn-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple, fast Linux download manager powered by aria2c with Omarchy theme & Quickshell support"
arch=('x86_64')

options=(!debug)
url="https://github.com/mirarr-app/dwn"
license=('MIT')
depends=('gtk3' 'aria2')
optdepends=(
  'quickshell: status bar widget support'
  'omarchy: Omarchy shell integration'
)
provides=('dwn')
conflicts=('dwn')
install=dwn.install

source=("$pkgname-$pkgver.tar.gz::https://github.com/mirarr-app/dwn/releases/download/$pkgver/dwn.tar.gz")
sha256sums=('SKIP')

package() {
  install -dm755 "$pkgdir/opt/dwn"
  cp -r "$srcdir"/* "$pkgdir/opt/dwn/"

  # Create executable wrapper
  install -dm755 "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/dwn" <<EOF
#!/bin/sh
exec /opt/dwn/dwn "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/dwn"

  # Desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/dwn.desktop" <<EOF
[Desktop Entry]
Name=dwn
Comment=Linux desktop download manager
Exec=dwn %F
Icon=/opt/dwn/data/flutter_assets/assets/images/image.png
Terminal=false
Type=Application
Categories=Network;FileTransfer;
EOF
}
