# Maintainer: lyj404 <lyj404 at proton dot me>
pkgname=keevault-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='A KeePass-compatible password manager built with Flutter'
arch=('x86_64')
url='https://github.com/lyj404/keevault'
license=('MIT')
depends=('gtk3' 'libsecret')
makedepends=()
provides=('keevault')
conflicts=('keevault')
source=("$url/releases/download/v$pkgver/KeeVault-v$pkgver-linux-x64.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir"
  install -d "$pkgdir/opt/keevault"
  cp -r * "$pkgdir/opt/keevault/"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/keevault/keevault "$pkgdir/usr/bin/keevault"

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/keevault.desktop" << EOF
[Desktop Entry]
Name=KeeVault
Comment=A KeePass-compatible password manager
Exec=/opt/keevault/keevault
Icon=keevault
Type=Application
Categories=Utility;
EOF

  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  if [ -f data/app_icon.png ]; then
    install -Dm644 data/app_icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/keevault.png"
  fi
}
