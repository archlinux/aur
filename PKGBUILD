# Maintainer: lyj404 <lyj404 at proton dot me>
pkgname=keestone-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='A KeePass-compatible password manager built with Flutter'
arch=('x86_64' 'aarch64')
url='https://github.com/lyj404/keestone'
license=('Apache-2.0')
depends=('gtk3' 'libsecret' 'dbus' 'libx11' 'libxi')
makedepends=()
provides=('keestone')
conflicts=('keestone')
source_x86_64=("$url/releases/download/v1.0.1/KeeStone-v$pkgver-linux-x64.tar.gz")
source_aarch64=("$url/releases/download/v1.0.1/KeeStone-v$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('3fc2c147ce2e94ef2a5a8bfc57a8ec5680bb744a08f593fb7add62478003fb8d')
sha256sums_aarch64=('80282f2491cbabf69669a205413cd9b45593b05f094b5f7ddd1c1c0bef9ff37a')

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
