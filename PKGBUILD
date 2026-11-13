# Maintainer: lyj404 <lyj404 at proton dot me>
pkgname=keestone-bin
pkgver=0.9.9beta.8
pkgrel=1
pkgdesc='A KeePass-compatible password manager built with Flutter'
arch=('x86_64' 'aarch64')
url='https://github.com/lyj404/keestone'
license=('Apache-2.0')
depends=('gtk3' 'libsecret' 'libayatana-appindicator' 'dbus')
makedepends=()
provides=('keestone')
conflicts=('keestone')
source_x86_64=("$url/releases/download/v0.9.9-beta.8/KeeStone-v$pkgver-linux-x64.tar.gz")
source_aarch64=("$url/releases/download/v0.9.9-beta.8/KeeStone-v$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('cbc6ace3b9f7d46aebc00bc42c86043173aed088932a26695c620d87ffe404ba')
sha256sums_aarch64=('4adea022d418b0e72a9024e40a9259c38124f00023e730d3bd798b065518e86c')

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
