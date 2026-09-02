# Maintainer: lyj404 <lyj404 at proton dot me>
pkgname=keestone-bin
pkgver=0.8.6
pkgrel=1
pkgdesc='A KeePass-compatible password manager built with Flutter'
arch=('x86_64')
url='https://github.com/lyj404/keestone'
license=('Apache-2.0')
depends=('gtk3' 'libsecret' 'libayatana-appindicator' 'dbus')
makedepends=()
provides=('keestone')
conflicts=('keestone')
source=("$url/releases/download/v$pkgver/KeeStone-v$pkgver-linux-x64.tar.gz")
sha256sums=('6a3e95576a1de3cc82aa6cf60ae791ed8bb3223c61f44b8f21d91a7547a19b5c')

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

