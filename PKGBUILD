# Maintainer: mirrar-app <iknowarch@proton.me>
pkgname=editt-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="A Flutter-based image view and editor app for linux"
arch=('x86_64')
url="https://github.com/mirarr-app/editt"
license=('MIT')
depends=('gtk3')
provides=('editt')
conflicts=('editt')

source=("$pkgname-$pkgver.tar.gz::https://github.com/mirarr-app/editt/releases/download/$pkgver/editt.tar.gz")
sha256sums=('SKIP')

package() {
  install -dm755 "$pkgdir/opt/editt"
  cp -r "$srcdir"/* "$pkgdir/opt/editt/"

  # Create executable
  install -dm755 "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/editt" <<EOF
#!/bin/sh
exec /opt/editt/editt "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/editt"

  # Desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/editt.desktop" <<EOF
[Desktop Entry]
Name=Editt
Comment=Photo editing and viewing app
Exec=editt %F
Icon=/opt/editt/data/flutter_assets/assets/images/image.png
Terminal=false
Type=Application
Categories=Graphics;2DGraphics;RasterGraphics;Viewer;
MimeType=image/jpeg;image/png;image/webp;image/jpg;
EOF
}
