# Maintainer: mirrar-app <iknowarch@proton.me>
pkgname=dwn-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A Flutter-based image view and editor app for linux"
arch=('x86_64')

options=(!debug)
url="https://github.com/mirarr-app/dwn"
license=('MIT')
depends=('gtk3')
provides=('dwn')
conflicts=('dwn')

source=("$pkgname-$pkgver.tar.gz::https://github.com/mirarr-app/dwn/releases/download/$pkgver/dwn.tar.gz")
sha256sums=('SKIP')

package() {
  install -dm755 "$pkgdir/opt/dwn"
  cp -r "$srcdir"/* "$pkgdir/opt/dwn/"

  # Create executable
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
