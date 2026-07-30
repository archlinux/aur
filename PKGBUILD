# Maintainer: lyj404 <lyj404 at proton dot me>
pkgname=keevault-bin
pkgver=0.7.9
pkgrel=1
pkgdesc='A KeePass-compatible password manager built with Flutter'
arch=('x86_64')
url='https://github.com/lyj404/keevault'
license=('Apache-2.0')
depends=('gtk3' 'libsecret' 'libayatana-appindicator' 'dbus')
makedepends=()
provides=('keevault')
conflicts=('keevault')
source=("$url/releases/download/v$pkgver/KeeVault-v$pkgver-linux-x64.tar.gz")
sha256sums=('94fbb55158063f0a2157f29985738b362730ce589560cacfe0c0a6710c683d88')

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

