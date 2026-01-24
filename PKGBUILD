# Maintainer: rutra8002


pkgname=butter-launcher-bin
pkgver=1.0.8
pkgrel=2
pkgdesc="Butter Launcher (Electron-based launcher, prebuilt binary)"
arch=('x86_64')
url="https://github.com/vZylev/Butter-Launcher"
provides=('butter-launcher')
conflicts=('butter-launcher')

source=("https://github.com/vZylev/Butter-Launcher/releases/download/v${pkgver}/butter-launcher.tar.gz")
sha256sums=('ec45757797ad25c385b8f1d7c718e83c45f80e96e6d61e6dc5d9a7b19f31ee3d')

package() {
  cd "$srcdir"

  tar -xzf butter-launcher.tar.gz

  install -d "$pkgdir/opt/butter-launcher"
  cp -r butter-launcher/* "$pkgdir/opt/butter-launcher/"

  chmod +x "$pkgdir/opt/butter-launcher/butter-launcher"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/butter-launcher/butter-launcher \
    "$pkgdir/usr/bin/butter-launcher"

  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/butter-launcher.desktop" <<EOF
[Desktop Entry]
Name=Butter Launcher
Exec=butter-launcher
Icon=butter-launcher
Type=Application
Categories=Game;
EOF
  install -Dm644 butter-launcher/LICENSE.electron.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
