pkgname=utiliti
pkgver=0.10.7
pkgrel=1
pkgdesc="utiLITI – The LITIENGINE Game Editor"
arch=('x86_64')
url="https://github.com/iamllcoolray/utiliti-aur-package"
license=('MIT')
depends=('java-runtime')
options=(!strip)
# Tell makepkg to copy your local zip instead of downloading
DLAGENTS=('local::/bin/cp')
source=(
  "local://litiengine-linux.zip"
  "utiLITI.desktop"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
  # Extract the zip locally so package() can copy files from the extracted folder
  bsdtar -xf litiengine-linux.zip
}

package() {
  install -d "$pkgdir/opt/$pkgname"

  # Copy the binary from extracted folder
  cp -a "$srcdir/utiliti/." "$pkgdir/opt/$pkgname/"
  chmod +x "$pkgdir/opt/$pkgname/bin/utiliti"

  # Create launcher script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/utiliti" <<EOF
#!/bin/bash
exec /opt/utiliti/bin/utiliti "\$@"
EOF

  # Desktop entry and icon
  install -Dm644 "$srcdir/utiLITI.desktop" "$pkgdir/usr/share/applications/utiliti.desktop"
  install -Dm644 "$srcdir/utiliti/lib/utiliti.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/utiliti.png"
}
