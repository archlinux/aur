# Maintainer: Amin Beheshti amin.bhst@gmail.com
pkgname=brisk
pkgver=2.3.8
pkgrel=1
pkgdesc="Ultra-fast, modern download manager (Official Release)"
arch=('x86_64')
url="https://github.com/BrisklyDev/brisk"
license=('GPL3') 
depends=(
  'ayatana-ido'
  'gtk3'
  'libayatana-appindicator'
  'libayatana-indicator'
  'libkeybinder3'
)

makedepends=('git')
source=("https://brisklydev.github.io/brisk/releases/aur/Brisk-v${pkgver}-linux-aur-x86_64.tar.xz")
md5sums=('SKIP')

package() {
  install -d "$pkgdir/opt/brisk"
  cp -r "$srcdir/"* "$pkgdir/opt/brisk"

  chmod +x "$pkgdir/opt/brisk/brisk"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/brisk/brisk "$pkgdir/usr/bin/brisk"

  sed -i \
    -e 's|^Exec=.*|Exec=/usr/bin/brisk|' \
    -e 's|^Icon=.*|Icon=brisk|' \
    "$srcdir/brisk.desktop"

  install -Dm644 "$srcdir/brisk.desktop" "$pkgdir/usr/share/applications/brisk.desktop"

  install -Dm644 "$srcdir/data/flutter_assets/assets/icons/logo-128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/brisk.png"
}
