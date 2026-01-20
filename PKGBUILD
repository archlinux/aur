# Maintainer: rutra8002

pkgname=butter-launcher-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Butter Launcher (Electron-based launcher, prebuilt binary)"
arch=('x86_64')
url="https://github.com/vZylev/Butter-Launcher"
provides=('butter-launcher')
conflicts=('butter-launcher')

source=("https://github.com/vZylev/Butter-Launcher/releases/download/v${pkgver}/butter-launcher.tar.gz")
sha256sums=('6a6ae20d54ccfa58b12660b44085ddde1231ecf2d303cc3c7ab732e89e0a170f')

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
