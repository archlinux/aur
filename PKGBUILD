# Maintainer: lyj404 <lyj404 at proton dot me>
pkgname=keestone-bin
pkgver=0.9.3
pkgrel=1
pkgdesc='A KeePass-compatible password manager built with Flutter'
arch=('x86_64' 'aarch64')
url='https://github.com/lyj404/keestone'
license=('Apache-2.0')
depends=('gtk3' 'libsecret' 'libayatana-appindicator' 'dbus')
makedepends=()
provides=('keestone')
conflicts=('keestone')
source_x86_64=("$url/releases/download/v$pkgver/KeeStone-v$pkgver-linux-x64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/KeeStone-v$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('396e573de29e85cbe74cac6a0f59e1410b94b2c3f5bb13900f1cdb2867598f00')
sha256sums_aarch64=('0647ed5ef5413802305f335a8cbd479a79b6c9f63ba01284ebb22e704306bb5f')

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
