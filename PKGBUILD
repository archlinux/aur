pkgname=uac-launch-control-bin
pkgver=0.666.2
pkgrel=1
pkgdesc="A launcher for managing Doom mods and configurations"
arch=('x86_64')
url="https://github.com/mikkelrask/uaclaunchcontrol"
license=('MIT')

depends=('gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils')

source=("$pkgname-$pkgver.tar.gz::https://github.com/mikkelrask/uaclaunchcontrol/releases/download/v$pkgver/uac-launch-control-$pkgver-linux-x64.tar.gz")
sha256sums=('SKIP')

package() {
  install -dm755 "$pkgdir/opt/uac-launch-control"
  cp -r "$srcdir/uac-launch-control-$pkgver-linux-x64/"* "$pkgdir/opt/uac-launch-control/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/uac-launch-control" <<EOF
#!/bin/bash
/opt/uac-launch-control/uac-launch-control "\$@"
EOF

  install -Dm644 "$pkgdir/opt/uac-launch-control/resources/app.asar.unpacked/resources/icon-128.png" \
    "$pkgdir/usr/share/pixmaps/uac-launch-control.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/uac-launch-control.desktop" <<EOF
[Desktop Entry]
Name=UAC Launch Control
Exec=uac-launch-control
Icon=uac-launch-control
Type=Application
Categories=Game;
EOF
}
