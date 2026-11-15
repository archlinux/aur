# Maintainer: lyj404 <lyj404 at proton dot me>
pkgname=keestone-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='A KeePass-compatible password manager built with Flutter'
arch=('x86_64' 'aarch64')
url='https://github.com/lyj404/keestone'
license=('Apache-2.0')
depends=('gtk3' 'libsecret' 'dbus' 'libx11' 'libxi')
makedepends=()
provides=('keestone')
conflicts=('keestone')
source_x86_64=("$url/releases/download/v1.0.0/KeeStone-v$pkgver-linux-x64.tar.gz")
source_aarch64=("$url/releases/download/v1.0.0/KeeStone-v$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('72f12e96eb37ff918ee454851724877b7d58cdc9cc3bfa0e5bc909227db7f03c')
sha256sums_aarch64=('a7b30f73fc21846ec1fe3611af91292a3661582d1585fc502232e37b936d23bb')

package() {
  cd "$srcdir"
  install -d "$pkgdir/opt/keestone"
  cp -r * "$pkgdir/opt/keestone/"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/keestone/keestone "$pkgdir/usr/bin/keestone"

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/keestone.desktop" << EOF
[Desktop Entry]
Name=KeeStone
Comment=A KeePass-compatible password manager
Exec=/opt/keestone/keestone
Icon=keestone
Type=Application
Categories=Utility;
EOF

  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  if [ -f data/app_icon.png ]; then
    install -Dm644 data/app_icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/keestone.png"
  fi
}
