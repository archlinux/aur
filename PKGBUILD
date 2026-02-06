# Maintainer: blekki <blekkiw at gmail dot com>
pkgname=anidesk-bin
pkgver=0.0.1.beta.6
pkgrel=1
pkgdesc="Unofficial desktop client for Anixart"
arch=('x86_64')
url="https://github.com/theDesConnet/AniDesk"
license=('GPL-2.0-only')
depends=()
source=(
  "https://github.com/theDesConnet/AniDesk/releases/download/v${pkgver//.beta/-beta}/anidesk-${pkgver//.beta/-beta}-linux-x64.tar.gz"
  "anidesk-bin.desktop"
  "icon.png"
)
sha256sums=('7fd31eaaeb361a27f00ce4097bb6fcebc23283992732f71e5da1a4ded7f0ed6a'
            '99a571d436f1a6c62570af4eacd730f8f4267daab9e7b409539b29b9e28a83ba'
            'c970f40c25d2a619f33cebe7d0c9edf08087e483921a2a5bc341bb73a54e199c')

package() {
  cd "$srcdir"

  install -d "$pkgdir/opt/$pkgname"
  cp -r AniDesk chrome* lib* *.pak *.dat *.so* *.bin *.json locales resources version LICENSE* "$pkgdir/opt/$pkgname/" 2>/dev/null || true
  chmod +x "$pkgdir/opt/$pkgname/AniDesk"
  chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/AniDesk" "$pkgdir/usr/bin/anidesk"

  install -d "$pkgdir/usr/share/applications"
  install -m644 "$srcdir/anidesk-bin.desktop" "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -m644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/anidesk-bin.png"
}
