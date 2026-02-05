# Maintainer: Your Name <dennnn8888@gmail.com>
pkgname=aniparser
pkgver=0.3.3
pkgrel=4
pkgdesc="AniParser Electron application"
arch=('x86_64')
url="https://github.com/Sinedka/aniparser"
license=('MIT')
depends=('electron' 'nodejs')
makedepends=('npm' 'git')
source=("https://github.com/Sinedka/aniparser/releases/download/v$pkgver/dist-full.tar.gz")
sha256sums=('b91cf548b05b03e09313a9ad40c7097add2a56455a4f5c4331a435878a809720')
build() {
  return 0
}

package() {
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/bin"

  install -Dm644 "${srcdir}"/dist-full/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/aniparser.png"
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
