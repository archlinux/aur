# Maintainer: lyj404 <lyj404 at proton dot me>
pkgname=keestone-bin
pkgver=0.9.9beta.4
pkgrel=1
pkgdesc='A KeePass-compatible password manager built with Flutter'
arch=('x86_64' 'aarch64')
url='https://github.com/lyj404/keestone'
license=('Apache-2.0')
depends=('gtk3' 'libsecret' 'libayatana-appindicator' 'dbus')
makedepends=()
provides=('keestone')
conflicts=('keestone')
source_x86_64=("$url/releases/download/v0.9.9-beta.4/KeeStone-v$pkgver-linux-x64.tar.gz")
source_aarch64=("$url/releases/download/v0.9.9-beta.4/KeeStone-v$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('b35d2ab93d6f0fecb7eb8aa5d533d308672497e0dcda2328b30de836344c10e7')
sha256sums_aarch64=('cc2b2af0c4ae2a62481ae17ac2b691a3ed5504f258f3460eeb3107a966075a47')

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
