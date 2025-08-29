# Maintainer: Your Name <dennnn8888@gmail.com>
pkgname=aniparser
pkgver=0.3.2
pkgrel=1
pkgdesc="AniParser Electron application"
arch=('x86_64')
url="https://github.com/Sinedka/aniparser"
license=('MIT')
depends=('electron' 'nodejs')
makedepends=('npm' 'git')
source=("https://github.com/Sinedka/aniparser/releases/download/v$pkgver/dist-full.tar.gz")
sha256sums=('ea6c31086439966d531c90cc3738ccdfb1b1e8daebb696a181bd132dc8ef1c93')
build() {
  return 0
}

package() {
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/bin"

  install -Dm644 "${srcdir}"/dist-electron/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/aniparser.png"
  cp -r "$srcdir/dist-full/." "$pkgdir/usr/lib/$pkgname/"

  # Создаём desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=Aniparser
Comment=AniParser Electron application
Exec=$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=Utility;
EOF

  # Скрипт запуска
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
exec electron /usr/lib/$pkgname
EOF
}
