# Maintainer: lyj404 <lyj404 at proton dot me>
pkgname=keestone-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='A KeePass-compatible password manager built with Flutter'
arch=('x86_64' 'aarch64')
url='https://github.com/lyj404/keestone'
license=('Apache-2.0')
depends=('gtk3' 'libsecret' 'dbus' 'libx11' 'libxi')
makedepends=()
provides=('keestone')
conflicts=('keestone')
source_x86_64=("$url/releases/download/v1.0.2/KeeStone-v$pkgver-linux-x64.tar.gz")
source_aarch64=("$url/releases/download/v1.0.2/KeeStone-v$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('12b807a0afe3a2801cb297bc56c5c2489e7bcbd8bd520900271e69dcd79e4110')
sha256sums_aarch64=('a3228e9df9d8bf46461ae7b5cd858531ee19f8d480f13cd97677edb464a56f97')

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
