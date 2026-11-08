# Maintainer: lyj404 <lyj404 at proton dot me>
pkgname=keestone-bin
pkgver=0.9.9beta.5
pkgrel=1
pkgdesc='A KeePass-compatible password manager built with Flutter'
arch=('x86_64' 'aarch64')
url='https://github.com/lyj404/keestone'
license=('Apache-2.0')
depends=('gtk3' 'libsecret' 'libayatana-appindicator' 'dbus')
makedepends=()
provides=('keestone')
conflicts=('keestone')
source_x86_64=("$url/releases/download/v0.9.9-beta.5/KeeStone-v$pkgver-linux-x64.tar.gz")
source_aarch64=("$url/releases/download/v0.9.9-beta.5/KeeStone-v$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('3554e5aa852ecbb8895cf5df9e0312f96c178006fb09fcd5544a6d5df7558792')
sha256sums_aarch64=('f2b90de0bd523c87beda1203efc77df9f656026de27fd9c732cb5a21299149d6')

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
