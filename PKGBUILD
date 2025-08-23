# Maintainer: Your Name <dennnn8888@gmail.com>
pkgname=aniparser
pkgver=0.3.0
pkgrel=4
pkgdesc="AniParser Electron application"
arch=('x86_64')
url="https://github.com/Sinedka/aniparser"
license=('MIT')
depends=('electron' 'nodejs')
makedepends=('npm' 'git')
source=("https://github.com/Sinedka/aniparser/releases/download/v$pkgver/dist-electron.tar.gz" "https://raw.githubusercontent.com/Sinedka/aniparser/refs/tags/v$pkgver/assets/icon.png")
sha256sums=('SKIP' 'SKIP')

build() {
  return 0
}

package() {
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/bin"

  # Распаковываем архив
  tar -xzf "$srcdir/dist-electron.tar.gz" -C "$pkgdir"/usr/lib/$pkgname

  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/aniparser.png"

  # Создаём desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=AniParser
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
exec electron /usr/lib/$pkgname/dist-electron/main.js "\$@"
EOF
}
